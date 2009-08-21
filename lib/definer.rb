module FRuby
  # This module implements "pattern matching" function definition style
  #
  # Author::      Mikhail Shakhanov  (mailto:mshakhan@gmail.com)
  # Copyright::   Copyright (c) 2009 mshakhan
  # License::     WTFPL
  module Definer
    def self.included(base)
      super
      base.class_eval do
        extend ClassMethods
      end
    end

    module ClassMethods
      # Defines method in "pattern-matching" style
      #
      # ==== Examples
      #
      #   class Test
      #     include FRuby::Definer   
      #     defun(:my_method)             { 'empty args' }
      #     defun(:my_method, Fixnum)     { |n| n }
      #     defun(:my_method, 0)          { 'zero' }
      #   end
      #   
      #   c = C.new
      #   c.my_method     # => 'empty args'
      #   c.my_method(42) # => 42
      #   c.my_method(0)  # => 'zero'
      #
      # ==== Parameters
      #
      # * <tt>name</tt> - Method name. Should be a Symbol or a String
      # * <tt>formal_args</tt> - Method's formal parameters. Might be a classes or a values
      # * <tt>&block</tt> - Method definition
      def defun(name, *formal_args, &block)
        define_or_append_condition(name, lambda { |*args| 
            FRuby::Matcher::match(formal_args, args)
          }, &block)
      end

      private
      def append_condition(method_name, condition, &block)
        condition_method_name = define_condition_method(method_name, &block)
        old_method_name = Utils::rand_condition_method_name(method_name)
        alias_method old_method_name, method_name
        private old_method_name
        
        define_method method_name do |*args|
          if condition.call(*args)
            method(condition_method_name).call(*args)
          else
            method(old_method_name).call(*args)
          end
        end
      end

      def define_or_append_condition(method_name, condition, &block)
        unless Utils::has_instance_method?(self, method_name)
          condition_method_name = define_condition_method(method_name, &block)
          define_method method_name do |*args|
            if condition.call(*args)
              method(condition_method_name).call(*args)
            end
          end
        else
          append_condition(method_name, condition, &block)
        end
      end

      def define_condition_method(method_name, &block)
        condition_method_name = Utils::rand_condition_method_name(method_name)
        define_method(condition_method_name, &block)
        private condition_method_name.to_sym
        condition_method_name
      end
    end
  end
end

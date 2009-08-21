module FRuby
  module Definer
    def self.included(base)
      super
      base.class_eval do
        extend ClassMethods
      end
    end

    module ClassMethods
      def defun(name, *formal_args, &block)
        define_or_append_condition(name, lambda { |*args| 
            FRuby::Matcher::match(formal_args, args)
          }, &block)
      end

      private
      def append_condition(method_name, condition, &block)
        condition_method_name = define_condition_method(method_name, &block)

        old_method_name = Utils::random_string(method_name)
        alias_method old_method_name, method_name
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
        condition_method_name = Utils::random_string(method_name)
        define_method(condition_method_name, &block)
        private condition_method_name
        condition_method_name
      end
    end
  end
end
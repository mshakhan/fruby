module FRuby
  module Utils extend self
    def rand_condition_method_name(prefix, size = 8)
      alphabet = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
      "__#{prefix}_condition_#{Array.new(size) { alphabet[rand(alphabet.size)] }.join}__"
    end

    def has_instance_method?(obj, method_name)
      obj.instance_methods.include? method_name.to_s
    end

    def multiple_each(*args, &block)
      args.first.size.times do |index|
        block.call(args.map { |arg| arg[index] })
      end
    end

    def multiple_all?(*args, &block)
      multiple_each(*args) do |*each_args|
        return false unless block.call(*each_args)
      end
      true
    end
  end
end
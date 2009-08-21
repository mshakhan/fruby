# Yep, I am not satisfied by standart ruby features =)
module Kernel
  def __DIR__
    File.dirname(__FILE__)
  end

  def alias_method(new, old)
    eval ":#{new} :#{old}"
  end
end

class Object
  def blank?
    respond_to?(:empty?) ? empty? : !self
  end

  def present?
    !blank?
  end
end

class NilClass
  def blank?
    true
  end
end

class FalseClass
  def blank?
    true
  end
end

class TrueClass
  def blank?
    false
  end
end

class Array
  def blank?
    self.compact.empty?
  end
end

class Hash
  alias_method :blank?, :empty?
end

class String
  def blank?
    self.strip.size == 0
  end
end

class Numeric
  def blank?
    false
  end
end

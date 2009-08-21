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

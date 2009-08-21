module FRuby
  module Matcher extend self
    def match(p1, p2)
      match_by_value(p1, p2) or match_by_class(p1, p2)
    end

    def match_by_value(p1, p2)
      if p1.is_a?(Array) and p2.is_a?(Array)
        match_arrays_by_value(p1, p2)
      else
        p1 == p2 || (p1.blank? && p2.blank?)
      end
    end

    def match_by_class(cls, p)
      if cls.is_a?(Array) and p.is_a?(Array)
        match_arrays_by_class(cls, p)
      else
        p.present? and cls == p.class
      end
    end

    def match_arrays_by_value(p1, p2)
      # TODO Think about it. Does [], [nil] and nil are equals to empty args?
      p1 = p1.flatten.compact
      p2 = p2.flatten.compact
      return false if p1.size != p2.size
      return true if p1.blank? and p2.blank?
      Utils::multiple_all?(p1, p2) do |a1, a2|
        match_by_value(a1, a2)
      end
    end

    def match_arrays_by_class(cls, p)
      return false if cls.size != p.size
      Utils::multiple_all?(cls, p) do |a1, a2|
        match_by_class(a1, a2)
      end
    end
  end
end
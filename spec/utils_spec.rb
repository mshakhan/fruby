require File.join(File.dirname(__FILE__), '..', 'lib', 'fruby')

class UtilsTest
  def method_exists; end
end

describe FRuby::Utils do
  it "Should return true if class has an instance method by string and symbol" do
    FRuby::Utils::has_instance_method?(UtilsTest, 'method_exists').should == true
    FRuby::Utils::has_instance_method?(UtilsTest, :method_exists).should == true
  end

  it "Should return false if class has not an instance method by string and symbol" do
    FRuby::Utils::has_instance_method?(UtilsTest, 'method_doesnt_exists').should_not == true
    FRuby::Utils::has_instance_method?(UtilsTest, :method_doesnt_exists).should_not == true
  end
end


require File.join(File.dirname(__FILE__), '..', 'lib', 'fruby')

class DefinerTest
  include FRuby::Definer

  defun(:test) { :empty } # empty args (no args, nil, [], [nil])
  defun(:test, String) { |s| s }
  defun(:test, 0) { :zero }
end


describe FRuby::Definer do
  before :each do 
    @inst = DefinerTest.new
  end

  it "Should return :empty if empty args" do
    @inst.test.should       == :empty
    @inst.test(nil).should  == :empty
    @inst.test([]).should   == :empty
  end

  it "Should return passed string if string passed" do
    @inst.test('string').should == 'string'
  end

  it "Should return :zero string if 0 passed" do
    @inst.test(0).should == :zero
  end

  it "Condition methods should be private" do
    DefinerTest.public_instance_methods.grep(/^test/).size.should == 1
  end
end


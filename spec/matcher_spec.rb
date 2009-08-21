require File.join(File.dirname(__FILE__), '..', 'lib', 'fruby')

describe FRuby::Matcher do
  it "Should match equal objects" do
    FRuby::Matcher::match(0, 0).should == true
    FRuby::Matcher::match([0, 1, 2], [0, 1, 2]).should == true
  end

  it "Should match by class" do
    FRuby::Matcher::match(Fixnum, 0).should == true
    FRuby::Matcher::match([Fixnum, String], [0, 'a']).should == true
  end

  it "Should match empty objects" do # but what is empty object?
    FRuby::Matcher::match([], [nil]).should == true
    FRuby::Matcher::match(nil, []).should == true
    FRuby::Matcher::match(nil, '').should == true
  end

  it "Should not match not equal objects" do
    FRuby::Matcher::match(0, 1).should_not == true
  end
end


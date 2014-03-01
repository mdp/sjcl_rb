require File.dirname(__FILE__) + '/spec_helper'

describe "the SJCL BitArray" do
  it "work with extract" do
    SJCL::BitArray.extract([1415934836, 543256164, 544042866], 0, 24).should eql(5530995)
    SJCL::BitArray.extract([-123123, 2345], 8, 16).should eql(65055)
  end
  it "should handle partials" do
    SJCL::BitArray.getPartial(26389912904448).should eql(24)
    SJCL::BitArray.bitLength([26389912904448]).should eql(24)
  end
  it "should make partials" do
    SJCL::BitArray.partial(32, 27).should eql(27)
    SJCL::BitArray.partial(24, 137).should eql(26388279101696)
    SJCL::BitArray.partial(16, 204).should eql(17592199413760)
  end
end

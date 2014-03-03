require File.dirname(__FILE__) + '/spec_helper'

describe "the SJCL BitArray" do
  it "work with extract" do
    SJCL::BitArray.extract([1415934836, 543256164, 544042866], 0, 24).should eql(5530995)
    SJCL::BitArray.extract([-123123, 2345], 8, 16).should eql(65055)
  end
  it "should handle partials" do
    SJCL::BitArray.getPartial(26389912904448).should eql(24)
    SJCL::BitArray.bitLength([26389912904448]).should eql(24)
    SJCL::BitArray.getPartial(1352435907).should eql(32)
  end
  it "should make partials" do
    SJCL::BitArray.partial(32, 27).should eql(27)
    SJCL::BitArray.partial(24, 137).should eql(26388279101696)
    SJCL::BitArray.partial(16, 204).should eql(17592199413760)
    SJCL::BitArray.partial(8, 3271557120, 1).should eql(8795069612032)
  end
  it "should correclty shiftRight" do
    conc =  SJCL::BitArray.shiftRight([-1505830413, 1352435907], 8, 2130706432, [])
    SJCL::BitArray.compare(conc, [2141601497, -212820856, 8795069612032])
  end
  it "should clamp" do
    clamped = SJCL::BitArray.clamp([2010473763, 1926277526, 2720643473, 3225629324], 128)
    SJCL::BitArray.compare(clamped, [2010473763, 1926277526, 2720643473, 3225629324])
  end
  it "should concat two bit arrays" do
    conc = SJCL::BitArray.concat([8798223728640],[-1505830413, 1352435907])
    SJCL::BitArray.compare(conc, [2141601497, -212820856, 8795069612032])
  end
end

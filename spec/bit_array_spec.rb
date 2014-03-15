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
    SJCL::BitArray.compare(conc, [2141601497, -212820856, 8795069612032]).should eql(true)
  end
  it "should clamp" do
    clamped = SJCL::BitArray.clamp([2010473763, 1926277526, 2720643473, 3225629324], 128)
    SJCL::BitArray.compare(clamped, [2010473763, 1926277526, 2720643473, 3225629324]).should eql(true)
    clamped = SJCL::BitArray.clamp([1868310588, 3653507289, 867213828, 1392911557, 17593804424619, 3441232331, 3819666098, 3925464908], 144)
    SJCL::BitArray.compare(clamped, [1868310588, 3653507289, 867213828, 1392911557, 17593804390400]).should eql(true)
  end
  it "should bitslice" do
    sliced = SJCL::BitArray.bitSlice([2010473763, 1926277526, 2720643473, 3225629324], 0, 64)
    SJCL::BitArray.compare(sliced, [2010473763, 1926277526]).should eql(true)
    sliced = SJCL::BitArray.bitSlice([1830956770, 3659299964, 4136255234, 2601935920], 0, 64)
    SJCL::BitArray.compare(sliced, [1830956770, 3659299964]).should eql(true)
  end
  it "should concat two bit arrays" do
    conc = SJCL::BitArray.concat([8798223728640],[-1505830413, 1352435907])
    SJCL::BitArray.compare(conc, [2141601497, -212820856, 8795069612032]).should eql(true)
    expected = [2215220552, 2472502247, 2970193637, 3874452154, -1941053952, -922223310, 17590738944000]
    conc = SJCL::BitArray.concat([2215220552, 2472502247, 2970193637, 3874452154, 17590244933632] ,[3724593415, 4247955903])
    SJCL::BitArray.compare(conc, expected).should eql(true)
  end
end

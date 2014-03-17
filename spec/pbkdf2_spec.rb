# encoding: UTF-8
require File.dirname(__FILE__) + '/spec_helper'

describe "the pbkdf2 function" do
  # Made with
  # sjcl.misc.pbkdf2("s33krit", [1788155662, -333625222], 10000, 256)
  it "Should match the SJCL version" do
    expected = [1281834603, 873294941, -458308553, 416318112, -296447020, -914288361, -236896704, 960061983]
    key = SJCL::Misc.pbkdf2("s33krit", "apUXDuwdSHo=", 10000, 256)
    SJCL::BitArray.compare(expected, key).should eql(true)
  end
end

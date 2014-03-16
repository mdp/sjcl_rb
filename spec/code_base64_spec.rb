require File.dirname(__FILE__) + '/spec_helper'

describe "the SJCL Base64 codec" do
  it "should encode to Base64" do
    input = [64820773, -671820644, 623614257, 1785858591, -135874193, -1906550637, -1401277189, -259576026]
    dec = SJCL::Codec::Base64.fromBits(input)
    expected = "A90WJdf01JwlK5kxanIKH/fmuW+OXFiTrHo0+/CHLyY="
    dec.should eql(expected)
  end
  it "should decode from bit array" do
    input = "A90WJdf01JwlK5kxanIKH/fmuW+OXFiTrHo0+/CHLyY="
    expected = [64820773, -671820644, 623614257, 1785858591, -135874193, -1906550637, -1401277189, -259576026]
    enc = SJCL::Codec::Base64.toBits(input)
    SJCL::BitArray.compare(enc, expected).should eql(true)
  end
end

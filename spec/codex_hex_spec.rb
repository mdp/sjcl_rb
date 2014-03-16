# encoding: UTF-8
require File.dirname(__FILE__) + '/spec_helper'

describe "the SJCL hex codec" do
  it "should encode from hex" do
    dec = SJCL::Codec::Hex.toBits("03dd1625d7f4d49c252b99316a720a1ff7e6b96f8e5c5893ac7a34fbf0872f26")
    expected = [64820773, -671820644, 623614257, 1785858591, -135874193, -1906550637, -1401277189, -259576026]
    SJCL::BitArray.compare(dec, expected).should eql(true)
  end
  it "should decode from bit array" do
    enc = SJCL::Codec::Hex.fromBits([64820773, -671820644, 623614257, 1785858591, -135874193, -1906550637, -1401277189, -259576026])
    enc.should eql("03dd1625d7f4d49c252b99316a720a1ff7e6b96f8e5c5893ac7a34fbf0872f26")
    enc = SJCL::Codec::Hex.fromBits([1634952294, 26389914019328])
    enc.should eql("61736466617366")
  end
end

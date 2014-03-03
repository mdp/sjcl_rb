# encoding: UTF-8
require File.dirname(__FILE__) + '/spec_helper'

describe "the SJCL string codec" do
  it "should encode a string" do
    SJCL::Codec::UTF8String.toBits("a").should eql([8797720412160])
    SJCL::Codec::UTF8String.toBits("abc").should eql([26389912904448])
    SJCL::Codec::UTF8String.toBits("abcd").should eql([1633837924])
    SJCL::Codec::UTF8String.toBits("This is a test!").should eql([1416128883, 543781664, 1629516901, 26390216057088])
    SJCL::Codec::UTF8String.toBits("ェア").should eql([3816990691, 17590082732032])
  end
  it "should decode a string" do
    SJCL::Codec::UTF8String.fromBits([1416128883, 543781664, 1629516901, 26390216057088]).should eql("This is a test!")
    SJCL::Codec::UTF8String.fromBits([-1029614491, 26390216057088]).should eql("¡Test!")
  end
end

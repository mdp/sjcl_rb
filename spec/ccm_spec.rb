require File.dirname(__FILE__) + '/spec_helper'

describe "CCM Mode" do
  cipher = SJCL::Cipher::AES.new(SJCL::Codec::UTF8String.toBits("Foo0Foo0Foo0Foo0Foo0Foo0Foo0Foo0"))
  plaintext = SJCL::Codec::UTF8String.toBits("Plaintext is plain")
  adata = SJCL::Codec::UTF8String.toBits("adata")
  iv = [-1505830413, 1352435907]
  describe "computing a tag" do
    it "should match SJCL CCM tags" do
      tag = SJCL::Mode::CCM.computeTag(cipher, plaintext, iv, adata, 64, 7)
      SJCL::BitArray.compare(tag,  [115834909, 246978874]).should eql(true)
    end
  end
  describe "ctr mode" do
    it "should match SJCL ctr mode" do
      expected = {tag:[1830956770,-635667332],data:[1868310588,-641460007,867213828,1392911557,17593804390400]}
      ctrEnc = SJCL::Mode::CCM.ctrMode(cipher, plaintext, iv, adata, 64, 13)
    end
  end
  describe "encrypting" do
    it "should match SJCL encryption with adata" do
      expected = [-2079746744, -1822465049, -1324773659, -420515142, -1941053952, -922223310, 17590738944000]
      enc = SJCL::Mode::CCM.encrypt(cipher, plaintext, iv, adata)
      SJCL::BitArray.compare(enc, expected).should eql(true)
    end
  end
end

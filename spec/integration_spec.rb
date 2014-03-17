# encoding: UTF-8
require File.dirname(__FILE__) + '/spec_helper'

describe "the SJCL aes crypto" do
  # Made with
  # sjcl.encrypt("s33krit", "This is a secret", {iter:10000, ks:256})
  it "should decrypt text from SJCL.js" do
    json = '{"iv":"OE68TjT18tvKwwZ9aGgKsw==","v":1,"iter":10000,"ks":256,"ts":64,"mode":"ccm","adata":"","cipher":"aes","salt":"e6txfS7y6wg=","ct":"RHYb19HUMcZb5/p9u1yd+ofyQRGHIuph"}'
    result = SJCL.decrypt('s33krit', json)
    result.should eql("This is a secret")
  end

  it "should encrypt text for SJCL.js" do
    result = SJCL.encrypt('s33krit', "This is a secret")
  end
end

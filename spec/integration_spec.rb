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
  it "should handle UTF-8" do
    json = '{"iv":"+Y+RZjk81MN9wkLVRgfLkA==","v":1,"iter":10000,"ks":256,"ts":64,"mode":"ccm","adata":"","cipher":"aes","salt":"4TD5tILYe6U=","ct":"NUeGvbXWVEmssnSGORpVSl1OefdLHjU2yPZnxVsPifyD1TJ3+w=="}'
    result = SJCL.decrypt('s33krit', json)
    result.should eql("农历新年 and 農曆新年")
  end

  it "should encrypt text for SJCL.js" do
    result = SJCL.encrypt('s33krit', "This is a secret")
    puts "sjcl.decrypt('s33krit','#{result}')"
    # Checking this by hand for now :(
  end

  it "should encrypt UTF-8 text" do
    result = SJCL.encrypt('s33krit', "农历新年 and 農曆新年")
    puts "sjcl.decrypt('s33krit','#{result}')"
    # Checking this by hand for now :(
  end
end

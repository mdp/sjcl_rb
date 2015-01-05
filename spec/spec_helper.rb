require 'rubygems'
require 'bundler/setup'
require 'rspec'

require 'sjcl'

RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

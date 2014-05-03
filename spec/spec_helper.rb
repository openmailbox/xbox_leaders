$:.unshift File.expand_path('../../lib', __FILE__)
require 'xbox_leaders'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = File.expand_path('../support/vcr_cassettes', __FILE__)
  c.hook_into :fakeweb 
end


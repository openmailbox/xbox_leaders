ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup'
Bundler.require(:default)

module XboxLive
end

require 'xbox_live/api'

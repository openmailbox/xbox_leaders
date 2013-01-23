ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup'
Bundler.require(:default)

module XboxLive
  API_ROOT = 'http://xboxleaders.com/api'
end

require 'xbox_live/gamer'

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup'
Bundler.require(:default)

module XboxLeaders; end

require 'xbox_leaders/api'

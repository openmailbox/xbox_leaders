# coding: utf-8
$:.unshift File.expand_path('../lib', __FILE__)
require 'xbox_leaders'

Gem::Specification.new do |spec|
  spec.name          = "xbox_leaders"
  spec.version       = XboxLeaders::VERSION
  spec.authors       = ["Brandon Rice"]
  spec.email         = ["brice84@gmail.com"]
  spec.description   = %q{A wrapper for the Xbox Live API provided by Xbox Leaders: https://www.xboxleaders.com/}
  spec.summary       = %q{An Xbox Live API wrapper}
  spec.homepage      = "https://github.com/nevern02/xbox_leaders"
  spec.license       = "MIT"
  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
end


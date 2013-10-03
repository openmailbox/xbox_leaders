# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xbox_leaders/version'

Gem::Specification.new do |spec|
  spec.name                  = "xbox_leaders"
  spec.version               = XboxLeaders::VERSION
  spec.authors               = ["Brandon Rice"]
  spec.email                 = ["brice84@gmail.com"]
  spec.description           = %q{A wrapper for the Xbox Live API provided by Xbox Leaders: https://www.xboxleaders.com/}
  spec.summary               = %q{An Xbox Live API wrapper}
  spec.homepage              = "https://github.com/nevern02/xbox_leaders"
  spec.license               = "MIT"
  spec.files                 = `git ls-files`.split($/)
  spec.test_files            = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths         = ['lib']
  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.0.0'

  spec.add_runtime_dependency 'httparty'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
end


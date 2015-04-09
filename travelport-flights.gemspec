# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'travelport/flights/version'

Gem::Specification.new do |spec|
  spec.name          = "travelport-flights"
  spec.version       = Travelport::Flights::VERSION
  spec.authors       = ["Ricardo Echavarria"]
  spec.email         = ["rgechavarria@gmail.com"]
  spec.summary       = "Gem to make calls to Travelport AirService"
  spec.description   = "Gem to make calls to Travelport AirService"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "activesupport"
  spec.add_dependency "httparty"
  spec.add_dependency "nokogiri"
end

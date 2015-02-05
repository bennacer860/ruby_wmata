# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_wmata/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_wmata"
  spec.version       = RubyWmata::VERSION
  spec.authors       = ["Rafik Bennacer"]
  spec.email         = ["bennacer860@gmail.com"]
  spec.summary       = "It is a simple WMATA api ruby wrapper"
  spec.description   = "With this gem you will be able to retrieve realtime information about stations, trains and incidents."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "httparty", "~> 0.13.3"
  spec.add_development_dependency "webmock", "~> 1.20.4"
  spec.add_development_dependency "rspec", "~> 3.1.0"
end

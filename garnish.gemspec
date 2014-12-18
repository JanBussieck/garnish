# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'garnish/version'

Gem::Specification.new do |spec|
  spec.name          = "garnish"
  spec.version       = Garnish::VERSION
  spec.authors       = ["Jan Bussieck"]
  spec.email         = ["jan.bussieck@gmail.com"]
  spec.summary       = %q{Creates decorators for models}
  spec.description   = %q{Decorates models by having the eigenclass extend the decorator as module, simple method call forwarding is used as delegation}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fluentd/v1/checker/version'

Gem::Specification.new do |spec|
  spec.name          = "fluentd-v1-checker"
  spec.version       = Fluentd::V1::Checker::VERSION
  spec.authors       = ["TAGOMORI Satoshi"]
  spec.email         = ["tagomoris@gmail.com"]
  spec.summary       = %q{Checker utility for Fluentd v1 configuration syntax}
  spec.description   = %q{Command to check Fluentd configuration files are valid as v1 configuration, or to check difference between v0 and v1 configuration files}
  spec.homepage      = "https://github.com/tagomoris/fluentd-v1-checker"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "fluentd"
  spec.add_runtime_dependency "diffy"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_download/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_download"
  spec.version       = SimpleDownload::VERSION
  spec.authors       = ["Jiahao Li"]
  spec.email         = ["isundaylee.reg@gmail.com"]
  spec.description   = "Handles basic download functionalities. "
  spec.summary       = "Handles basic download functionalities, including progress reporting. "
  spec.homepage      = "http://ljh.me"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

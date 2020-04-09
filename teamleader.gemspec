# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require File.expand_path('../lib/teamleader/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "teamleader"
  spec.version       = Teamleader::VERSION
  spec.authors       = ["Pierre-Yves Orban"]
  spec.email         = ["pyo@javry.com"]
  spec.homepage      = 'https://github.com/Pyo25/teamleader-ruby'

  spec.summary       = %q{A Ruby wrapper around Teamleader.eu API}
  spec.description   = %q{A ruby wrapper around Teamleader.eu API.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency 'rspec', "~> 3.6"
  spec.add_development_dependency "vcr", "~> 3.0"
  spec.add_development_dependency "typhoeus", "~> 1.1"

  spec.required_ruby_version = ">= 1.9.3"

  spec.add_dependency "json", ">= 1"

end

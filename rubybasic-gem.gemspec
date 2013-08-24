# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubybasic/gem/version'

Gem::Specification.new do |spec|
  spec.name          = "rubybasic-gem"
  spec.version       = Rubybasic::Gem::VERSION
  spec.authors       = ["ongaeshi"]
  spec.email         = ["ongaeshi0621@gmail.com"]
  spec.description   = %q{RubyBasic installer and executer}
  spec.summary       = %q{RubyBasic installer and executer}
  spec.homepage      = "https://github.com/ongaeshi/rubybasic-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor'
  spec.add_dependency 'fetcher'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

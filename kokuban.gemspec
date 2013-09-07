# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kokuban/gem/version'

Gem::Specification.new do |spec|
  spec.name          = "kokuban"
  spec.version       = Kokuban::Gem::VERSION
  spec.authors       = ["ongaeshi"]
  spec.email         = ["ongaeshi0621@gmail.com"]
  spec.description   = %q{RubyKokuban installer and executer}
  spec.summary       = %q{RubyKokuban installer and executer}
  spec.homepage      = "https://github.com/ongaeshi/rubybasic-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'archive-zip'
  spec.add_dependency 'fetcher', "~> 0.1.0"
  spec.add_dependency 'thor'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

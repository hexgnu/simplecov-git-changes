# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simplecov/git-changes/version'

Gem::Specification.new do |spec|
  spec.name          = "simplecov-git-changes"
  spec.version       = SimpleCov::Formatter::GitChangesFormatter::VERSION
  spec.authors       = ["Matt Kirk"]
  spec.email         = ["matt@matthewkirk.com"]
  spec.description   = %q{A simple simplecov formatter that looks at branch changes and correlates them with simplecov coverage}
  spec.summary       = %q{a very simple formatter for simplecov that breaks down coverage by user} 
  spec.homepage      = "https://www.github.com/hexgnu/simplecov-git-changes"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'simplecov'
  spec.add_runtime_dependency 'rugged'
  spec.add_runtime_dependency 'git_diff_parser'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end

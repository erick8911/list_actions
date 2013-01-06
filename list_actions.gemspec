# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'list_actions/version'

Gem::Specification.new do |gem|
  gem.name          = "list_actions"
  gem.version       = ListActions::VERSION
  gem.authors       = ["Erick"]
  gem.email         = ["erick.8911@gmail.com"]
  gem.description   = %q{List all your actions and export it to a CSV}
  gem.summary       = %q{List actions}
  gem.homepage      = ""

  gem.add_development_dependency "ruby_parser"
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

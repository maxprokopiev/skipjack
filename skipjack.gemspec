# -*- encoding: utf-8 -*-
require File.expand_path('../lib/skipjack/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Max Prokopiev"]
  gem.email         = ["max-prokopiev@yandex.ru"]
  gem.description   = %q{ Ruby implementation of the Skipjack cipher }
  gem.summary       = %q{ Ruby implementation of the Skipjack cipher }
  gem.homepage      = ""

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "skipjack"
  gem.require_paths = ["lib"]
  gem.version       = Skipjack::VERSION
end

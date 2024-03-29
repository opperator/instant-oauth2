# -*- encoding: utf-8 -*-
require File.expand_path('../lib/instant_oauth2/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["TODO: Write your name"]
  gem.email         = ["michael@intridea.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "instant-oauth2"
  gem.require_paths = ["lib"]
  gem.version       = InstantOAuth2::VERSION

  gem.add_dependency 'grape'
  gem.add_development_dependency 'oauth2'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rack-test'
end

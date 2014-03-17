# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sjcl/version"

Gem::Specification.new do |s|
  s.name        = "sjcl"
  s.version     = SJCL::VERSION
  s.platform    = Gem::Platform::RUBY
  s.license     = "MIT"
  s.authors     = ["Mark Percival"]
  s.email       = ["mark@markpercival.us"]
  s.homepage    = "http://github.com/mdp/rotp"
  s.summary     = %q{A Ruby library for interopping with SJCL's AES crypto}

  s.rubyforge_project = "sjcl"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('pbkdf2')
  s.add_development_dependency('rake')
  s.add_development_dependency('rspec')
end

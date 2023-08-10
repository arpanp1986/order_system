# -*- encoding: utf-8 -*-
# stub: parallel_rspec 2.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "parallel_rspec".freeze
  s.version = "2.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Will Bryant, Powershop New Zealand Ltd".freeze]
  s.bindir = "exe".freeze
  s.date = "2023-07-12"
  s.description = "This gem lets you run your RSpec examples in parallel across across your CPUs.  Each worker automatically gets its own database to avoid conflicts.  The optional spring-prspec gem adds support for running under Spring.".freeze
  s.email = ["will.bryant@gmail.com".freeze]
  s.executables = ["prspec".freeze]
  s.files = ["exe/prspec".freeze]
  s.homepage = "https://github.com/willbryant/parallel_rspec".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.7".freeze
  s.summary = "This gem lets you run your RSpec examples in parallel across across your CPUs.".freeze

  s.installed_by_version = "3.3.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rake>.freeze, ["> 10.0"])
    s.add_runtime_dependency(%q<rspec>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rake>.freeze, ["> 10.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end

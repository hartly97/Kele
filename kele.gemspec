# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kele/version"

Gem::Specification.new do |spec|
  spec.name          = "kele"
  spec.version       = Kele::VERSION
  spec.date          = '2017-06-15'
  spec.authors       = ["Michelle Hartley"]
  spec.summary       = 'Kele API Client'
  spec.description   = 'A client for the Bloc API'
  spec.email         = ["mhartwikitree@gmail.com"]
  spec.files         = ['lib/kele.rb']
  spec.require_paths = ["lib"]
  spec.homepage      =
     'http://rubygems.org/gems/kele'


  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  s.license       = 'MIT'
   s.add_runtime_dependency 'httparty', '~> 0.13'
 end
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against " \
  #    "public gem pushes."
  #end

  #spec.files         = `git ls-files -z`.split("\x0").reject do |f|
  #  f.match(%r{^(test|spec|features)/})
  #end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
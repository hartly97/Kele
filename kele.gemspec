Gem::Specification.new do |spec|
  spec.name          = 'kele'
  spec.version       = '0.0.1'
  spec.date          = '2017-06-15'
  spec.authors       = ['Michelle Hartley']
  spec.summary       = 'Kele API Client'
  spec.description   = 'A client for the Bloc API'
  spec.email         = ['mhartwikitree@gmail.com']
  spec.files         = ['lib/kele.rb']
  spec.require_paths = ["lib"]
  spec.homepage      =
     'http://rubygems.org/gems/kele'

  spec.license       = 'MIT'
  spec.add_runtime_dependency 'httparty', '~> 0.13'
 end

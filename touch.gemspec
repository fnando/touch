require "./lib/touch/version"

Gem::Specification.new do |spec|
  spec.name          = "touch"
  spec.version       = Touch::VERSION
  spec.authors       = ["Nando Vieira"]
  spec.email         = ["fnando.vieira@gmail.com"]
  spec.description   = "Touch a parent's collection on ActiveRecord."
  spec.summary       = spec.description
  spec.homepage      = "http://github.com/fnando/touch"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry-meta"
  spec.add_development_dependency "sqlite3"
end

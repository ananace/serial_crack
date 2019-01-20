require File.join(File.expand_path('lib', __dir__), 'serial_crack/version')

Gem::Specification.new do |spec|
  spec.name          = 'serial_crack'
  spec.version       = SerialCrack::VERSION
  spec.authors       = ['Alexander Olofsson']
  spec.email         = ['ace@haxalot.com']

  spec.summary       = 'A cracker for serial connected hardware'
  spec.description   = spec.summary
  spec.homepage      = 'https://gitlab.com/ananace/serial_crack'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rake'

  spec.add_dependency 'progressbar', '~> 1.10.0'
  spec.add_dependency 'rubyserial', '~> 0.6.0'
end

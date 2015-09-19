lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

version = File.read(File.expand_path('version'))

Gem::Specification.new do |spec|
  spec.name = 'xbox_live_api'
  spec.version = version
  spec.authors = ['Jacob Oakes']
  spec.email = ['jacoboakes92@gmail.com']
  spec.summary = 'A wrapper library for Xbox Live\'s undocumented api'
  spec.description = 'A library that uses Xbox Live\'s undocumented api to provide you with information about users, game, and achievements'
  spec.homepage = 'https://github.com/oakesja/xbox-live-api'
  spec.license = 'MIT'
  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_dependency 'httpclient', '~> 2.6'
  spec.add_dependency 'oj', '~> 2.12'
end

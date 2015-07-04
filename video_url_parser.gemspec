# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'video_url_parser/version'

Gem::Specification.new do |spec|
  spec.name          = 'video_url_parser'
  spec.version       = VideoURLParser::VERSION
  spec.authors       = ['Mike Kenyon']
  spec.email         = ['mike.kenyon@gmail.com']

  spec.summary       = 'Parse URLs from YouTube videos or Facebook videos'
  spec.description   = 'Need to dynamically embed videos from YouTube or Facebook? Extract the video ID easily'
  spec.homepage      = 'https://github.com/mkenyon/video_url_parser'
  spec.license       = 'MIT'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    fail 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'guard', '~> 2.12'
  spec.add_development_dependency 'guard-minitest', '~> 2.4'
  spec.add_development_dependency 'minitest', '~> 5.7'
  spec.add_development_dependency 'minitest-reporters', '~> 1.0'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'pry-byebug', '~> 3.1'
  spec.add_development_dependency 'rake', '~> 10.0'
end

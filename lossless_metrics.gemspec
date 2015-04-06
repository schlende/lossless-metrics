# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lossless_metrics/version'

Gem::Specification.new do |spec|
  spec.name          = "lossless_metrics"
  spec.version       = LosslessMetrics::VERSION
  spec.authors       = ["Walt Schlender"]
  spec.email         = ["walt@wildnotion.com"]
  spec.description   = "This gem provides a simple mechanism for collecting and visualizing event data for your application."
  spec.summary       = "Install this gem, mount the sinatra app on a sub-domain of your app and run the generator to begin collecting stats"
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency                  'sinatra'
  spec.add_dependency                  'activerecord', '~> 4.1.1'
  spec.add_development_dependency      'rails', '~> 4.1.1'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
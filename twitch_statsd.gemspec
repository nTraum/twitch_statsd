# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "twitch_statsd/version"

Gem::Specification.new do |spec|
  spec.name          = "twitch_statsd"
  spec.version       = TwitchStatsd::VERSION
  spec.authors       = ["Philipp Preß"]
  spec.email         = ["philipp.press@googlemail.com"]

  spec.summary       = "Metrics collection for Twitch channels via StatsD"
  spec.homepage      = "https://github.com/nTraum/twitch_statsd"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rufus-scheduler", "~> 3.1"

  spec.add_development_dependency "bundler",     "~> 1.10"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake",        "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rspec"
end

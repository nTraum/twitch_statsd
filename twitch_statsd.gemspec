lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "twitch_statsd/version"

Gem::Specification.new do |spec|
  spec.name                  = "twitch_statsd"
  spec.version               = TwitchStatsd::VERSION
  spec.authors               = ["Philipp Preß"]
  spec.email                 = ["philipp.press@googlemail.com"]

  spec.summary               = "Metrics collection for Twitch channels via StatsD"
  spec.homepage              = "https://github.com/nTraum/twitch_statsd"
  spec.license               = "MIT"

  spec.files                 = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir                = "exe"
  spec.executables           = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths         = ["lib"]
  spec.required_ruby_version = "~> 2.1"

  spec.add_runtime_dependency "rufus-scheduler",   "~> 3.1"
  spec.add_runtime_dependency "statsd-ruby",       "~> 1.2"
  spec.add_runtime_dependency "twitch",            "~> 0.1"

  spec.add_development_dependency "bundler",       "~> 1.10"
  spec.add_development_dependency "climate_control"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-bundler"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-rubocop"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake",          "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "simplecov"
end

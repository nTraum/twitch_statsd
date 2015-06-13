$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "simplecov"
SimpleCov.start do
  add_filter("/spec/")
  minimum_coverage(100)
end

require "twitch_statsd"

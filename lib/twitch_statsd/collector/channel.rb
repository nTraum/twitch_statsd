require "statsd-ruby"

module TwitchStatsd
  module Collector
    class Channel
      STATSD_BUCKET_PREFIX = :channel

      attr_reader :statsd_client

      def initialize
        @statsd_client          = Statsd.new(Configuration.statsd_host, Configuration.statsd_port)
        statsd_client.namespace = Configuration.statsd_namespace
      end

      def call(_job = nil, _time = nil)
        channel_metric = Reporter::Channel.call

        statsd_client.gauge(bucket_name_for(:delay), channel_metric.delay)
        statsd_client.gauge(bucket_name_for(:followers), channel_metric.followers)
        statsd_client.gauge(bucket_name_for(:views), channel_metric.views)
      end

      private

      def bucket_name_for(stat)
        [Configuration.channel_name, STATSD_BUCKET_PREFIX, stat].map(&:to_s).map(&:downcase).join(".")
      end
    end
  end
end

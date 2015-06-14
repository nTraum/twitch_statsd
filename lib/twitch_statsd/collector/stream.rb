require "statsd-ruby"

module TwitchStatsd
  module Collector
    class Stream
      STATSD_BUCKET_PREFIX = :stream

      attr_reader :statsd_client

      def initialize
        @statsd_client          = Statsd.new(Configuration.statsd_host, Configuration.statsd_port)
        statsd_client.namespace = Configuration.statsd_namespace
      end

      def call(_job = nil, _time = nil)
        channel_metric = Reporter::Stream.call

        statsd_client.gauge(bucket_name_for(:average_fps), channel_metric.average_fps)
        statsd_client.gauge(bucket_name_for(:video_height), channel_metric.video_height)
        statsd_client.gauge(bucket_name_for(:viewers), channel_metric.viewers)
      end

      private

      def bucket_name_for(stat)
        [Configuration.channel_name, STATSD_BUCKET_PREFIX, stat].map(&:to_s).map(&:downcase).join(".")
      end
    end
  end
end

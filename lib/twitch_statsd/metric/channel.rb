module TwitchStatsd
  module Metric
    class Channel
      attr_reader :followers, :views, :delay

      def initialize(followers:, views:, delay:)
        @delay     = delay
        @followers = followers
        @views     = views
      end
    end
  end
end

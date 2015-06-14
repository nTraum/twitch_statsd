module TwitchStatsd
  module Metric
    class Channel
      attr_reader :delay, :followers, :views

      def initialize(delay:, followers:, views:)
        @delay     = delay
        @followers = followers
        @views     = views
      end
    end
  end
end

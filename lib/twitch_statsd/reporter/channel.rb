require "twitch"

module TwitchStatsd
  module Reporter
    module Channel
      module_function

      def call(_job = nil, _time = nil)
        twitch       = Twitch.new
        api_response = twitch.channel(Configuration.channel_name)
        metric_from(response: api_response)
      end

      private

      def self.metric_from(response:)
        body      = response.fetch(:body)

        delay     = body.fetch("delay")
        followers = body.fetch("followers")
        views     = body.fetch("views")

        Metric::Channel.new(delay: delay, followers: followers, views: views)
      end
    end
  end
end

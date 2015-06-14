require "twitch"

module TwitchStatsd
  module Reporter
    module Stream
      module_function

      def call
        twitch       = Twitch.new
        api_response = twitch.stream(Configuration.channel_name)
        metric_from(response: api_response)
      end

      private

      def self.metric_from(response:)
        stream_info    = response.fetch(:body)["stream"]

        if stream_info
          viewers      = stream_info.fetch("viewers")
          game         = stream_info.fetch("game")
          average_fps  = stream_info.fetch("average_fps")
          video_height = stream_info.fetch("video_height")

          Metric::Stream.new(viewers: viewers,
                             game: game, average_fps: average_fps, video_height: video_height, online: true)
        else
          Metric::Stream.new(online: false)
        end
      end
    end
  end
end

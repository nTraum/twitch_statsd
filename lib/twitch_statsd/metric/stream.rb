module TwitchStatsd
  module Metric
    class Stream
      attr_reader :viewers, :game, :average_fps, :video_height

      def initialize(viewers: nil, game: nil, average_fps: nil, video_height: nil, online:)
        @average_fps  = average_fps
        @game         = game
        @video_height = video_height
        @viewers      = viewers
        @online       = online
      end

      def online?
        @online
      end

      def offline?
        !online?
      end
    end
  end
end

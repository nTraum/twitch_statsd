require "rufus-scheduler"

module TwitchStatsd
  class Monitor
    DEFAULT_INTERVAL = 30

    attr_reader :interval

    def initialize(interval: DEFAULT_INTERVAL)
      @interval = interval
    end
  end
end

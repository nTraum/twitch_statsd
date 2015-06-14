require "rufus-scheduler"

module TwitchStatsd
  class Monitor
    attr_reader :scheduler

    def initialize
      @scheduler = Rufus::Scheduler.new
    end

    def start
      scheduler.every(Configuration.check_interval, Collector::Channel)
      scheduler.join
    end
  end
end

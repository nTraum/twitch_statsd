require "rufus-scheduler"

module TwitchStatsd
  class Monitor
    def initialize
      @scheduler = Rufus::Scheduler.new
    end

    def start
      scheduler.every(Configuration.check_interval, Reporter::Channel)
      scheduler.join
    end

    protected

    attr_reader :scheduler
  end
end

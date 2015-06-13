module TwitchStatsd
  module Configuration
    DEFAULT_CHECK_INTERVAL = 60
    DEFAULT_STATSD_HOST    = "127.0.0.1"
    DEFAULT_STATSD_PORT    = 8125

    module_function

    def statsd_host
      custom_statsd_host || DEFAULT_STATSD_HOST
    end

    def statsd_port
      if custom_statsd_port
        Integer(custom_statsd_port)
      else
        DEFAULT_STATSD_PORT
      end
    end

    def check_interval
      if custom_check_interval
        Integer(custom_check_interval)
      else
        DEFAULT_CHECK_INTERVAL
      end
    end

    private

    def self.custom_check_interval
      ENV["TWITCH_STATSD_CHECK_INTERVAL"]
    end

    def self.custom_statsd_host
      ENV["TWITCH_STATSD_HOST"]
    end

    def self.custom_statsd_port
      ENV["TWITCH_STATSD_PORT"]
    end
  end
end

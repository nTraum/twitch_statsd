RSpec.describe TwitchStatsd::Configuration do
  describe ".check_interval" do
    context "when not specified via environment variable" do
      it "returns the default check interval" do
        expect(subject.check_interval).to eq(60)
      end
    end

    context "when specified via environment variable TWITCH_STATSD_CHECK_INTERVAL" do
      let(:check_interval) { 300 }
      it "returns the specified check interval" do
        with_modified_env(TWITCH_STATSD_CHECK_INTERVAL: "#{check_interval}") do
          expect(subject.check_interval).to eq(check_interval)
        end
      end
    end
  end

  describe ".statsd_host" do
    context "when not specified via environment variable" do
      it "returns the default host" do
        expect(subject.statsd_host).to eq("127.0.0.1")
      end
    end

    context "when specified via environment variable TWITCH_STATSD_HOST" do
      let(:statsd_host) { "8.8.8.8" }
      it "returns the specified host" do
        with_modified_env(TWITCH_STATSD_HOST: statsd_host) do
          expect(subject.statsd_host).to eq(statsd_host)
        end
      end
    end
  end

  describe ".statsd_port" do
    context "when not specified via environment variable" do
      it "returns the default port" do
        expect(subject.statsd_port).to eq(8125)
      end
    end

    context "when specified via environment variable TWITCH_STATSD_PORT" do
      let(:statsd_port) { "1234" }
      it "returns the specified port" do
        with_modified_env(TWITCH_STATSD_PORT: statsd_port) do
          expect(subject.statsd_port).to eq(statsd_port.to_i)
        end
      end
    end
  end

  describe ".statsd_namespace" do
    context "when not specified via environment variable" do
      it "returns nil" do
        expect(subject.statsd_namespace).to be_nil
      end
    end

    context "when specified via environment variable TWITCH_STATSD_NAMESPACE" do
      let(:statsd_namespace) { "foobar" }
      it "returns the specified namespace" do
        with_modified_env(TWITCH_STATSD_NAMESPACE: statsd_namespace) do
          expect(subject.statsd_namespace).to eq(statsd_namespace)
        end
      end
    end
  end
end

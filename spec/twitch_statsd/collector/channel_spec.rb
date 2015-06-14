RSpec.describe TwitchStatsd::Collector::Channel do
  subject { described_class.new }

  describe ".call" do
    let(:delay)           { 0 }
    let(:followers)       { 100 }
    let(:views)           { 1337 }
    let(:channel_name)    { "rocketbeanstv" }
    let(:channel_metric)  { TwitchStatsd::Metric::Channel.new(delay: delay, followers: followers, views: views) }
    let(:statsd_client)   { double(:statsd_client) }

    before do
      expect(TwitchStatsd::Reporter::Channel).to receive(:call).and_return(channel_metric)
      expect(TwitchStatsd::Configuration).to receive(:channel_name).and_return(channel_name).exactly(3).times
      expect(Statsd).to receive(:new).and_return(statsd_client)
      expect(statsd_client).to receive(:namespace=)
    end

    it "sends the metrics to the correct StatsD buckets" do
      expect(statsd_client).to receive(:gauge).with("#{channel_name}.channel.delay", channel_metric.delay)
      expect(statsd_client).to receive(:gauge).with("#{channel_name}.channel.followers", channel_metric.followers)
      expect(statsd_client).to receive(:gauge).with("#{channel_name}.channel.views", channel_metric.views)
      subject.call
    end
  end
end

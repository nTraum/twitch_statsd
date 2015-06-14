RSpec.describe TwitchStatsd::Collector::Stream do
  subject { described_class.new }

  describe ".call" do
    let(:average_fps)   { 24.9 }
    let(:viewers)       { 100 }
    let(:game)          { "Team Fortress 2" }
    let(:video_height)  { 1080 }
    let(:channel_name)  { "rocketbeanstv" }
    let(:stream_metric) { TwitchStatsd::Metric::Stream.new(game: game,
                                                           average_fps: average_fps,
                                                           viewers: viewers,
                                                           video_height: video_height,
                                                           online: true) }
    let(:statsd_client) { double(:statsd_client) }

    before do
      expect(TwitchStatsd::Reporter::Stream).to receive(:call).and_return(stream_metric)
      expect(TwitchStatsd::Configuration).to receive(:channel_name).and_return(channel_name).exactly(3).times
      expect(Statsd).to receive(:new).and_return(statsd_client)
      expect(statsd_client).to receive(:namespace=)
    end

    it "sends the metrics to the correct StatsD buckets" do
      expect(statsd_client).to receive(:gauge).with("#{channel_name}.stream.average_fps", stream_metric.average_fps)
      expect(statsd_client).to receive(:gauge).with("#{channel_name}.stream.video_height", stream_metric.video_height)
      expect(statsd_client).to receive(:gauge).with("#{channel_name}.stream.viewers", stream_metric.viewers)
      subject.call
    end
  end
end

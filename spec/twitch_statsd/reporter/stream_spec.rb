RSpec.describe TwitchStatsd::Reporter::Stream do
  describe ".call" do
    let(:twitch_client) { double(:twitch_client) }
    let(:api_response)  { { body: { "stream" => stream } } }

    before do
      allow(Twitch).to receive(:new).and_return(twitch_client)
      allow(TwitchStatsd::Configuration).to receive(:channel_name)
      allow(twitch_client).to receive(:stream).and_return(api_response)
    end

    context "when the stream is online" do
      let(:viewers)      { 1337 }
      let(:game)         { "Team Fortress 2" }
      let(:average_fps)  { 24.6 }
      let(:video_height) { 1080 }
      let(:stream) do
        { "viewers"      => viewers,
          "game"         => game,
          "average_fps"  => average_fps,
          "video_height" => video_height
        }
      end

      it "returns a stream metric that is online and contains the correct metrics" do
        metric = subject.call

        expect(metric).to be_online
        expect(metric.viewers).to eq(viewers)
        expect(metric.game).to eq(game)
        expect(metric.average_fps).to eq(average_fps)
        expect(metric.video_height).to eq(video_height)
      end
    end

    context "when the stream is offline" do
      let(:stream) { nil }

      it "returns a stream metric that is offline" do
        metric = subject.call
        expect(metric).to be_offline
      end
    end
  end
end

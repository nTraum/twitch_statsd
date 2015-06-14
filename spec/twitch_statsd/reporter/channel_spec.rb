RSpec.describe TwitchStatsd::Reporter::Channel do
  describe ".call" do
    let(:twitch_client) { double(:twitch_client) }
    let(:delay)         { 0 }
    let(:followers)     { 100 }
    let(:views)         { 1337 }
    let(:api_response)  { { body: { "delay" => delay, "followers" => followers, "views" => views } } }

    before do
      allow(Twitch).to receive(:new).and_return(twitch_client)
      allow(TwitchStatsd::Configuration).to receive(:channel_name)
      allow(twitch_client).to receive(:channel).and_return(api_response)
    end

    it "returns a channel metric with correct metrics" do
      metric = subject.call
      expect(metric.delay).to eq(delay)
      expect(metric.followers).to eq(followers)
      expect(metric.views).to eq(views)
    end
  end
end

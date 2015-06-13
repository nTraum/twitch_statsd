require "spec_helper"

describe TwitchStatsd::Metric::Stream do
  let(:viewers)      { 123 }
  let(:game)         { "Team Fortress 2" }
  let(:average_fps)  { 24.9 }
  let(:video_height) { 1080 }

  context "when the stream is online" do
    let(:online) { true }

    subject do
      described_class.new(game: game,
                          average_fps: average_fps,
                          viewers: viewers,
                          video_height: video_height,
                          online: online)
    end

    describe "#online?" do
      specify { expect(subject).to be_online }
    end

    describe "#offline?" do
      specify { expect(subject).not_to be_offline }
    end

    describe "#game" do
      specify { expect(subject.game).to eq(game) }
    end

    describe "#average_fps" do
      specify { expect(subject.average_fps).to eq(average_fps) }
    end

    describe "#viewers" do
      specify { expect(subject.viewers).to eq(viewers) }
    end

    describe "#video_height" do
      specify { expect(subject.video_height).to eq(video_height) }
    end
  end

  context "when the stream is offline" do
    let(:online) { false }

    subject { described_class.new(online: false) }

    describe "#online?" do
      specify { expect(subject).not_to be_online }
    end

    describe "#offline?" do
      specify { expect(subject).to be_offline }
    end
  end
end

require "spec_helper"

describe TwitchStatsd::Monitor do
  describe "#interval" do
    context "when it has not been specified" do
      subject { described_class.new }

      it "uses the default value" do
        expect(subject.interval).to eq(described_class::DEFAULT_INTERVAL)
      end
    end

    context "when it has been specified" do
      let(:interval) { 120 }
      subject { described_class.new(interval: interval) }

      it "uses the specified value" do
        expect(subject.interval).to eq(interval)
      end
    end
  end
end

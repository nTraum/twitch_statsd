RSpec.describe TwitchStatsd::Metric::Channel do
  let(:delay)     { 0 }
  let(:followers) { 100 }
  let(:views)     { 2000 }

  subject { described_class.new(followers: followers, views: views, delay: delay) }

  describe "#followers" do
    specify { expect(subject.followers).to eq(followers) }
  end

  describe "#views" do
    specify { expect(subject.views).to eq(views) }
  end

  describe "#delay" do
    specify { expect(subject.delay).to eq(delay) }
  end
end

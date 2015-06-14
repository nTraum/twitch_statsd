RSpec.describe TwitchStatsd::Monitor do
  describe "#start" do
    let(:scheduler) { double(:scheduler) }

    subject { described_class.new }

    before do
      allow(Rufus::Scheduler).to receive(:new).and_return(scheduler)
      allow(scheduler).to receive(:every)
      allow(scheduler).to receive(:join)
    end

    after { subject.start }

    it "schedules the reporters with the configured check interval once" do
      expect(scheduler).to receive(:every).with(TwitchStatsd::Configuration.check_interval,
                                                TwitchStatsd::Collector::Channel).once

      expect(scheduler).to receive(:every).with(TwitchStatsd::Configuration.check_interval,
                                                TwitchStatsd::Collector::Stream).once
    end

    it "joins the current thread with the scheduler thread" do
      expect(scheduler).to receive(:join).with(no_args).once
    end
  end
end

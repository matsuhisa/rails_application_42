require "rails_helper"

RSpec.describe EventApplicationMailer, type: :mailer do
  let(:event_application) { build(:event_application) }

  describe '.notify_entry' do
    subject { EventApplicationMailer.notify_entry(event_application).deliver_now }

    it do
      #expect(subject.subject).to eq "#{name}さん ありがとうございます"
      expect(subject.to).to eq ['example@example.com']
    end
  end
end

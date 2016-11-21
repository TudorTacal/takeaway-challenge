require "sms"

describe SMS do
  subject(:sms) {described_class.new}
  let(:client) { double(:client, messages: messages)}
  let(:messages) { double(:messages) }
  context "when #text_message it" do
    it "should send a message to 07414991997" do
      args = {
        :from => '123',
        :to => '321',
        :body => "Thank you! Your order can be delivered before 18:52",
      }
      expect(messages).to receive(:create).with(args)
      sms.text_message(args)
     end
  end

end

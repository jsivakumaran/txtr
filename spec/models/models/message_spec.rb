require 'rails_helper'
describe Message, :vcr => true do
  it "doesn't save the message if  twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '111111', :from => '(562) 217-4998')
    expect(message.save).to eql(false)
  end


  it "adds an error if the number is invalid" do
    message = Message.new(:body => 'hi', :to => '111111', :from => '(562) 217-4998')
    message.save
    message.errors.should eq 'something bad'
  end
end

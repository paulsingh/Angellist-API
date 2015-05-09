require 'spec_helper'

describe AngellistApi::Client::Press do
  let(:client) { AngellistApi::Client.new }

  describe '#get_press_startups' do
    it 'gets 1/press' do
      options = { startup_id: 6702 }
      client.should_receive(:get).with("1/press", options).and_return("success")
      client.get_press_startups(options).should == 'success'
    end
  end
  
  describe '#get_press' do
    it 'gets 1/press' do
      press_id = 125462
      client.should_receive(:get).with("1/press/#{press_id}").and_return("success")
      client.get_press(press_id).should == 'success'
    end
  end
end

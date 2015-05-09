require 'spec_helper'

describe AngellistApi::Client::Press,
  :vcr => { :cassette_name => 'press' } do

  let(:client) { AngellistApi::Client.new }
  let(:press_id) { 125462 } # 500 Startups Techrunch article

  it 'gets press for a given startup' do
    options = { startup_id: 6702 }
    press = client.get_press_startups(options).press
    press.first.should have_key :title
    press.first.should have_key :url
  end
  
  it 'gets a press with a given ID' do
    press = client.get_press(press_id)
    press.id.should equal(press_id)
    press.should have_key :title
    press.should have_key :url
  end
end


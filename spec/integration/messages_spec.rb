require 'spec_helper'

describe AngellistApi::Client::Messages, :authenticated,
  # Personal for authenticated account, manually maintained fixture
  :vcr => { :cassette_name => 'messages', :record => :none } do

  let(:client) { AngellistApi::Client.new }

  it 'gets all messages for a user' do
    messages = client.get_messages
    messages.should have_key :messages  # Blergh.

    thread = messages.messages.first
    [:last_message, :thread_id, :users].each do |field|
      thread.should have_key field
    end
  end

  it 'marks messages as read for a user' do
    read_messages = client.post_mark_messages([1, 2, 3])
    read_messages.should include(1, 2, 3)
  end
end


#encoding: UTF-8
require_relative '../helper'

describe "Retrieve items from Channel" do
  
  it "Seek new items from channel with non empty results" do

    client = Reader::Client.new 
    items = client.retrieve_from 'http://www.reddit.com/r/science/.rss'
    items.wont_be_nil
    items.wont_be_empty 

  end

end

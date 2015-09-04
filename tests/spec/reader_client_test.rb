#encoding: UTF-8
require_relative '../helper'

describe "Retrieve items from Channel" do
  
  it "Seek new items from channel with non empty results" do

    url = 'http://www.reddit.com/r/science/.rss'
    feeder = mock()
    results = mock()
    feeder.expects(:rss_from).with(url).returns(results)
    results.expects(:items).returns(["item1","item2"])
    client = Reader::Client.new(feeder)
    items = client.retrieve_from url
    items.wont_be_nil
    items.wont_be_empty 

  end

  it "Seek new items from channel with empty results" do

    url = 'http://www.reddit.com/r/science/.rss'
    feeder = mock()
    results = mock()
    feeder.expects(:rss_from).with(url).returns(results)
    results.expects(:items).returns([])
    client = Reader::Client.new(feeder)
    items = client.retrieve_from url
    items.wont_be_nil
    items.must_be_empty 

  end

end

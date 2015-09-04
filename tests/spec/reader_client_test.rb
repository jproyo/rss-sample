#encoding: UTF-8
require_relative '../helper'

describe "Retrieve items from Channel" do
  
  it "Seek new items from channel with non empty results" do

    url = 'http://www.reddit.com/r/science/.rss'
    channel = Reader::Channel.new
    channel.link = url
    feeder = mock()
    results = mock()
    feeder.expects(:rss_from).with(url).returns(results)
    results.expects(:items).returns([:link => "item1", :link=> "item2"])
    client = Reader::Client.new(feeder)
    items = client.retrieve_from channel
    items.wont_be_nil
    items.wont_be_empty 

  end

  it "Seek new items from channel with empty results" do

    url = 'http://www.reddit.com/r/science/.rss'
    channel = Reader::Channel.new
    channel.link = url
    feeder = mock()
    results = mock()
    feeder.expects(:rss_from).with(url).returns(results)
    results.expects(:items).returns([])
    client = Reader::Client.new(feeder)
    items = client.retrieve_from channel
    items.wont_be_nil
    items.must_be_empty 

  end


  it "Seek new items from channel fails result and raise exceptions" do

    url = 'http://www.reddit.com/r/science/.rss'
    channel = Reader::Channel.new
    channel.link = url
    feeder = mock()
    results = mock()
    feeder.expects(:rss_from).raises
    results.expects(:items).never
    client = Reader::Client.new(feeder)
    -> { client.retrieve_from channel }.must_raise RuntimeError

  end

end

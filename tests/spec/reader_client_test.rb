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
    persistence = mock()
    persistence.expects(:channel_by_id).with(2).returns(channel)
    persistence.expects(:save).returns([{:link => "item1", :was_updated=>true}, {:link=> "item2",:was_updated=>true}].map(&Reader::Item.method(:new)))
    client = Reader::Client.new(feeder,persistence)
    items = client.retrieve_from 2
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
    persistence = mock()
    persistence.expects(:channel_by_id).with(1).returns(channel)
    persistence.expects(:save).returns([{:link => "item1", :was_updated=>false}, {:link=> "item2",:was_updated=>false}].map(&Reader::Item.method(:new)))
    client = Reader::Client.new(feeder,persistence)
    items = client.retrieve_from 1
    items.wont_be_nil
    items.must_be_empty 

  end


  it "Seek new items from unexisting channel" do

    url = 'http://www.reddit.com/r/science/.rss'
    feeder = mock()
    results = mock()
    feeder.expects(:rss_from).never
    results.expects(:items).never
    persistence = mock()
    persistence.expects(:channel_by_id).with(22).returns(nil)
    persistence.expects(:save).returns([])
    client = Reader::Client.new(feeder,persistence)
    items = client.retrieve_from 22
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
    persistence = mock()
    persistence.expects(:channel_by_id).with(2).returns(channel)
    client = Reader::Client.new(feeder,persistence)    
    -> { client.retrieve_from 2 }.must_raise RuntimeError

  end

end

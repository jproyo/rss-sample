#encoding: UTF-8
module Reader

  class Client

    attr_accessor :feeder, :persistence

    def initialize(feeder=nil, persistence=nil)
      @feeder = feeder || Feeder.new
      @persistence = persistence || Persistence.new(:host => "localhost", :username => "root")
    end

    def channels
      @persistence.channels
    end

    def retrieve_from(channel_id)
      channel = @persistence.channel_by_id(channel_id)
      items = @feeder.rss_from(channel.link).items.map(&Item.method(:new))
      @persistence.save(items,channel).select{ |i| i.was_updated }
    end

  end

end
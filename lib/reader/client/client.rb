#encoding: UTF-8
module Reader

  class Client

    attr_accessor :feeder, :persistence

    def initialize(feeder=nil, persistence=nil)
      @feeder = feeder || Feeder.new
      @persistence = persistence || Persistence.new
    end

    def channels
      @persistence.channels
    end

    def channel(id)
      @persistence.channel_by_id(id)
    end

    def retrieve_from(channel_id)
      channel = channel(channel_id)
      items = retrieve(channel)
      @persistence.save(items,channel).select{ |i| i.was_updated }
    end

    def retrieve_all_from(channel_id)
      channel = channel(channel_id)
      retrieve(channel)
    end

    def retrieve(channel)
      return @feeder.rss_from(channel.link).items.map(&Item.method(:new)) unless channel.nil?
      []
    end

  end

end
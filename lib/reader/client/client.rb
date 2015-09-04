#encoding: UTF-8
module Reader

  class Client

    attr_accessor :feeder, :persistence

    def initialize(feeder=nil)
      @feeder = feeder || Feeder.new
      @persistence = Persistence.new
    end

    def channels
      @persistence.channels
    end

    def retrieve_from(channel)
      rss = @feeder.rss_from channel.link
      items = rss.items.map(&Item.method(:new))
    end

  end

end
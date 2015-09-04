#encoding: UTF-8
module Reader

  class Feeder

    def rss_from(url)
      SimpleRSS.parse open(url)
    end

  end

end
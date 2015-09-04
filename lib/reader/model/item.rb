#encoding: UTF-8
module Reader

  class Item
    include Reader::HashieBuilder

    attr_accessor :guid, :title, :description, :link, :pub_date, :channel_id, :was_updated

    def initialize(attrs={})
      super
    end

    def title
      @title.force_encoding("UTF-8")
    end

    def description
      CGI.unescapeHTML(@description.force_encoding("UTF-8"))
    end
  end

end
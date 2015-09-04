#encoding: UTF-8
module Reader

  class Item
    include Reader::HashieBuilder

    attr_accessor :guid, :title, :description, :link, :pub_date, :channel_id

    def initialize(attrs={})
      super
    end

  end

end
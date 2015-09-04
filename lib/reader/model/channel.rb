#encoding: UTF-8
module Reader

  class Channel
    include Reader::HashieBuilder

    attr_accessor :id, :title, :description, :link, :pub_date

    def initialize(attrs={})
      super
    end

  end

end
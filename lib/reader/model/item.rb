#encoding: UTF-8
module Reader

  class Item
    include Reader::HashieBuilder

    attr_accessor :guid, :title, :description, :link, :pub_date, :channel_id, :was_updated

    def initialize(attrs={})
      super
    end

    ["title", "description"].each do |field|
      define_method("#{field}_enc") do 
        value = send(field.to_sym)
        return value unless value.encoding.name == 'UTF-8'
        value.force_encoding("UTF-8")
      end
    end

  end

end
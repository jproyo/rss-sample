#encoding: UTF-8
module Reader

  class Persistence

    attr_reader :options

    def initialize(options={})
      @options = options
      Mysql2::Client.default_query_options.merge!(:symbolize_keys => true)
    end

    def channels
      client.query("select * from channels").map(&Channel.method(:new))
    end

    def save(items)
      items.each do |i|
        client.xquery("insert into items (guid,title,link,description,pub_date,channel_id) values (?,?,?,?,?,?)",i.guid,i.title,i.description,i.pub_date,i.channel_id)
      end
    end


    private 

    def client
      Mysql2::Client.new(@options)
    end

  end

end
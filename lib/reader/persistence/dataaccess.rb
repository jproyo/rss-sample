#encoding: UTF-8
module Reader

  class Persistence

    attr_reader :options

    def initialize(options={})
      @options = {
        :database => ENV['RSS_DB_NAME'] || "rss_reader",
        :host => ENV['RSS_DB_HOST'] || "localhost",
        :username => ENV['RSS_DB_USERNAME'] || "root",
        :password => ENV['RSS_DB_PASSWORD'] || ''
      }
      @options.merge!(options)
      Mysql2::Client.default_query_options.merge!(:symbolize_keys => true)
    end

    def channels
      client.query("select * from channels").map(&Channel.method(:new))
    end

    def channel_by_id(id)
      channel = client.xquery("select * from channels where id = ?",id).first
      return Channel.new(channel) unless channel.nil?
      nil
    end

    def save(items, channel)
      items.map do |i|
        i.channel_id = channel.id
        exists = client.xquery("select 1 from items where guid = ?", i.guid)
        client.xquery("insert into items (guid,title,link,description,pub_date,channel_id) values (?,?,?,?,?,?)",i.guid,i.title,i.link,i.description,i.pub_date,i.channel_id) if exists.size == 0
        i.was_updated = exists.size == 0
        i
      end
    end


    private 

    def client
      Mysql2::Client.new(@options)
    end

  end

end
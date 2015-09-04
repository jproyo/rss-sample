#encoding: UTF-8
module Reader

  class Cli < Thor

    desc "channels [db_host] [db_user] [db_pass]", "List avaiable channels to select"
    def channels(db_host,db_user,db_pass)
      puts "Channels List"
      puts "============="
      Client.new(Feeder.new, Persistence.new(:host => db_host, :username => db_user, :password => db_pass)).channels.each do |c|
        puts "Channel id #{c.id} - Title #{c.title} - Link #{c.link}"
      end
    end

    desc "items [channel_id] [db_host] [db_user] [db_pass]", "List last items from specific channel"
    def items(channel_id, db_host,db_user,db_pass)
      puts "Last Items List for Channel #{channel_id}"
      puts "========================================="
      Client.new(Feeder.new, Persistence.new(:host => db_host, :username => db_user, :password => db_pass)).retrieve_from(channel_id).each do |c|
        puts "Item Title #{c.title} - Link #{c.guid}"
        puts "============================================================\n"
        puts "Item Description #{c.description}"
        puts "============================================================\n\n"
      end
    end

    desc "all_items [channel_id] [db_host] [db_user] [db_pass]", "List all items from specific channel no mather if they are new"
    def items_all(channel_id, db_host,db_user,db_pass)
      puts "All Items List for Channel #{channel_id}"
      puts "========================================="
      Client.new(Feeder.new, Persistence.new(:host => db_host, :username => db_user, :password => db_pass)).retrieve_all_from(channel_id).each do |c|
        puts "Item Title #{c.title} - Link #{c.guid}"
        puts "============================================================\n"
        puts "Item Description #{c.description}"
        puts "============================================================\n\n"
      end
    end
  end

end
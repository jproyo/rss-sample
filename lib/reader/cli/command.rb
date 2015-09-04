#encoding: UTF-8
module Reader

  class Cli < Thor

    desc "channels", "List avaiable channels to select"
    def channels
      puts "Channels List"
      puts "============="
      Client.new.channels.each do |c|
        puts "Channel id #{c.id} - Title #{c.title} - Link #{c.link}"
      end
    end

    desc "items [channel_id]", "List last items from specific channel"
    def items(channel_id)
      puts "Last Items List for Channel #{channel_id}"
      puts "========================================="
      Client.new.retrieve_from(channel_id).each do |c|
        puts "Item Title #{c.title_enc} - Link #{c.guid}"
        puts "============================================================\n"
        puts "Item Description #{CGI.unescapeHTML(c.description_enc)}"
        puts "============================================================\n\n"
      end
    end

    desc "all_items [channel_id]", "List all items from specific channel no mather if they are new"
    def items_all(channel_id)
      puts "All Items List for Channel #{channel_id}"
      puts "========================================="
      Client.new.retrieve_all_from(channel_id).each do |c|
        puts "Item Title #{c.title_enc} - Link #{c.guid}"
        puts "============================================================\n"
        puts "Item Description #{CGI.unescapeHTML(c.description_enc)}"
        puts "============================================================\n\n"
      end
    end
  end

end
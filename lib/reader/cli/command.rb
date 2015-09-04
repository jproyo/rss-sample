#encoding: UTF-8
module Reader

  class Cli < Thor

    desc "rss channels", "List avaiable channels to select"
    def hello(name)
      puts "Hello #{name}"
    end

  end

end
#encoding: UTF-8
module Reader

  class Persistence

    attr_reader :options

    def initialize(options={})
      @options = options
    end

    def channel_by_title(title='JavaScript')
    end


    private 

    def client
      Mysql2::Client.new(@options)
    end

  end

end
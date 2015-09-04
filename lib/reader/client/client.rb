#encoding: UTF-8
module Reader

  class Client

    attr_accessor :feeder

    def initialize(feeder=nil)
      @feeder = feeder || Feeder.new
    end

  end

end
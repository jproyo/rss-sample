#encoding: UTF-8
module Reader
  module HashieBuilder
    def initialize(attrs = {})
      attrs.each do |var, value|
        setter = "#{var}="
        send(setter, value) if respond_to?(setter)
      end
    end

    def to_hash
      hash = Hash.new
      instance_variables.each do |var|
        hash[var.to_s.delete("@").to_sym] = instance_variable_get(var)
      end
      hash
    end

    def to_s
      self.to_hash.to_s
    end

  end
end
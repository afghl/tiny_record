module TinyRecord
  class AttributeSet

    class << self
      def build_from_database(column_names)
        hash = {}
        column_names.each { |name| hash[name] = nil }
        new hash
      end
    end

    # expected a hash as parameters
    def initialize(attributes)
      @attributes = attributes
    end

    def [](name)
      attributes[name]
    end

    def write_value(name, value)
      attributes[name] = value
    end

    protected

    attr_accessor :attributes
  end
end

module TinyRecord

  # a proxy for the attributes of a record instance
  class AttributeSet

    class << self
      def build_from_database(columns)
        hash = {}
        columns.each do |column|
          attr = Attribute.from_database(column.name, nil, column.cast_type)
          hash[column.name.intern] = attr
        end
        new hash
      end
    end

    #
    # expected a hash as parameters
    def initialize(attributes)
      @attributes = attributes
    end

    def [](name)
      @attributes[name]
    end

    def write_from_user(name, value)
      @attributes[name] = self[name].with_value_from_user(value)
    end

    def fetch_value(name)
      @attributes[name].value
    end

    def initialize_dup(_)
      @attributes = @attributes.dup
      super
    end

    def initialize_clone(_)
      @attributes = @attributes.clone
      super
    end
  end
end

module TinyRecord
  class Attribute
    class << self
      def from_database(name, value, type)
        FromDatabase.new(name, value, type)
      end

      def from_user(name, value, type)
        FromUser.new(name, value, type)
      end

      def null(name)
        Null.new(name)
      end
    end

    attr_reader :name, :value_before_type_cast, :type

    def initialize(name, value_before_type_cast, type)
      @name = name
      @value_before_type_cast = value_before_type_cast
      @type = type
    end

    def value
      @value ||= type_cast(value_before_type_cast)
    end

    def type_cast(value)
      raise "not implement"
    end

    def with_value_from_user(value)
      self.class.from_user(name, value, type)
    end

    protected

    class Null < Attribute
      def initialize(_); end
    end

    class FromDatabase < Attribute
      def type_cast(value)
        type.type_cast_from_database(value)
      end
    end

    class FromUser < Attribute
      def type_cast(value)
        type.type_cast_from_user(value)
      end
    end
  end
end

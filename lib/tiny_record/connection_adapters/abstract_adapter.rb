module TinyRecord
  class AbstractAdapter

    private

    def lookup_cast_type(sql_type) # :nodoc:
      type_map.lookup(sql_type)
    end

    def type_map # :nodoc:
      @type_map ||= Type::TypeMap.new.tap do |mapping|
        initialize_type_map(mapping)
      end
    end

    def initialize_type_map(m)
      register_type_class m, %r(char)i, Type::String
      register_type_class m, %r(int)i, Type::Integer
    end

    def register_type_class(mapping, key, klass)
      mapping.register_type(key, klass.new)
    end

  end
end

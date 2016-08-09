module TinyRecord
  module Type
    class TypeMap

      def initialize
        @mapping = {}
      end

      # TODO
      def lookup(sql_type)
        matching_pair = @mapping.reverse_each.detect do |key, _|
          key === lookup_key
        end

        if matching_pair
          matching_pair.last
        else
          default_value
        end
      end

      def register_type(key, value)
        @mapping[key] = value
      end

    end
  end
end

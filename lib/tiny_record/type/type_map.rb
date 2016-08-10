module TinyRecord
  module Type
    class TypeMap

      # type mapping store hash where sql_type regex as key and the actual abstract class for the sql_type
      # for instance: /char/i => #<TinyRecord::Type::String>
      def initialize
        @mapping = {}
      end


      def lookup(sql_type)
        matching_pair = @mapping.each.detect do |key, _|
          key === sql_type
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

      private

      def default_value
        @default_value ||= Value.new
      end
    end
  end
end

module TinyRecord
  module Type
    class Value
      def type_cast_from_database(value)
        value
      end

      def type_cast_from_user(value)
        value
      end
    end
  end
end

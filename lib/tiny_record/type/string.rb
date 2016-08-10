module TinyRecord
  module Type
    class String < Value
      def type_cast_from_database(value)
        return nil if value.nil?
        value.to_s
      end
    end
  end
end

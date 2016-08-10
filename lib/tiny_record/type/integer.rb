module TinyRecord
  module Type
    class Integer < Value
      def type_cast_from_user(value)
        return nil if value.nil?
        value.to_i
      end
    end
  end
end

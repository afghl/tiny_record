module TinyRecord
  class Base
    extend Querying

    class << self
      def all
        table
      end

      def table_name
        name.downcase + "s"
      end

      def table
        Arel::Table.new(table_name)
      end
    end
  end
end

module TinyRecord
  class Base

    class << self
      def all
        arel_table.project Arel.sql('*')
      end

      def table_name
        name.downcase + "s"
      end

      def arel_table
        @arel_table ||= Arel::Table.new(table_name, ConnectionAdapters::Mysql2Engine.new)
      end
    end
  end
end

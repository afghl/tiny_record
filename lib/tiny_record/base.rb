module TinyRecord
  class Base

    class << self
      def connection
        @connection ||= ConnectionAdapters::Mysql2Adapter.new
      end

      def all
        arel_table.project Arel.sql("*")
      end

      def where(opt)
        arel_table.where(arel_table[:id].eq(2)).project Arel.sql("*")
      end

      def table_name
        name.downcase + "s"
      end

      def arel_table
        @arel_table ||= Arel::Table.new(table_name, self)
      end
    end
  end
end

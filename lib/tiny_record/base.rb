module TinyRecord
  class Base

    class << self
      def connection
        @connection ||= ConnectionAdapters::Mysql2Adapter.new
      end

      def all
        arel_table.project Arel.sql("*")
      end

      def where(options)
        scope = arel_table
        options.each do |k, v|
          scope = scope.where(arel_table[k].eq(v))
        end
        scope.project Arel.sql("*")
      end

      def count
        query = Arel::SelectManager.new(arel_table.engine).from(self.table_name).project("*")
        p query.to_sql
        @connection.execute(query.to_sql)[0]['count'].to_i
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

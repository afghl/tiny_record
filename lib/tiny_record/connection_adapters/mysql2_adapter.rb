module TinyRecord
  module ConnectionAdapters

    class Mysql2Adapter

      def initialize
        @client = Mysql2::Client.new(host: "localhost", username: "root", database: "tiny_record")
      end

      def visitor
        @visitor ||= Arel::Visitors::MySQL.new self
      end

      def quote_table_name(arg)
        arg
      end

      def quote_column_name(arg)
        arg
      end

      def table_exists?(name)
        true
      end

      def quote(value, column)
        "'#{value.to_s}'"
      end

      def schema_cache
        @schema_cache ||= SchemaCache.new(self)
      end

      def columns(table_name)
        sql = "SHOW FULL FIELDS FROM #{table_name}"

        results = execute sql
        results.to_a
      end

      def execute(sql)
        @client.query sql
      end

    end

  end
end

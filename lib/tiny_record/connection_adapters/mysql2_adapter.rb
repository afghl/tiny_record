module TinyRecord
  module ConnectionAdapters

    class Mysql2Adapter

      def initialize
        @client = Mysql2::Client.new(
                    host: "localhost",
                    username: "root",
                    database: "tiny_record"
                  )
      end

      def visitor
        @visitor ||= Arel::Visitors::MySQL.new(self)
      end

      def quote_table_name(arg); arg; end
      def quote_column_name(arg); arg; end

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
        @columns ||= begin
          sql = "SHOW FULL FIELDS FROM #{table_name}"

          exec_query(sql).rows.map { |c| Column.new(c["Field"]) }
        end
      end

      # for example: when insert a record with no values,
      # a mysql sql should be: INSERT INTO `posts` VALUES ()
      def empty_insert_statement_value
        "VALUES ()"
      end

      def execute(sql)
        @client.query sql
      end

      def exec_query(sql)
        result = execute(sql)
        Result.new(result.fields, result.to_a)
      end
    end
  end
end

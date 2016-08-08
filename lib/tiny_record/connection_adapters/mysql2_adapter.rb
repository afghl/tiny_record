module TinyRecord
  module ConnectionAdapters
    class Mysql2Adapter < AbstractAdapter

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

      # TODO: 这里不需要cache， 因为在schema_cache里保证里只会调用一次
      def columns(table_name)

        @columns ||= begin
          sql = "SHOW FULL FIELDS FROM #{table_name}"

          exec_query(sql).rows.map do |field|
            field_name = field["Field"]
            sql_type = field["Type"]
            cast_type = lookup_cast_type(field["Type"])
            Column.new(field_name, sql_type, cast_type)
          end
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

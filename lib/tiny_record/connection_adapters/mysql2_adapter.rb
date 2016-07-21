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

      def schema_cache
        @schema_cache ||= SchemaCache.new(self)
      end

      def columns(table_name)
        sql = "SHOW FULL FIELDS FROM #{table_name}"

        result = execute sql
        p result.first
        # execute_and_free(sql, 'SCHEMA') do |result|
        #   each_hash(result).map do |field|
        #     field_name = set_field_encoding(field[:Field])
        #     new_column(field_name, field[:Default], field[:Type], field[:Null] == "YES", field[:Collation], field[:Extra])
        #   end
        # end
      end

      def execute(sql)
        @client.query sql
      end

    end

  end
end

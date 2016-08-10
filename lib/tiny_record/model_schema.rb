module TinyRecord
  module ModelSchema

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def connection
        @connection ||= ConnectionAdapters::Mysql2Adapter.new
      end

      def table_name
        name.downcase + "s"
      end

      def arel_table
        @arel_table ||= Arel::Table.new(table_name, self)
      end

      def _default_attributes
        @_default_attributes ||= AttributeSet.build_from_database(columns)
      end

      def columns
        schema_cache.columns(table_name)
      end

      def column_names
        columns.map(&:name)
      end

      def schema_cache
        connection.schema_cache
      end
    end
  end

end

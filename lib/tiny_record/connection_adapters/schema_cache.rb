module TinyRecord
  module ConnectionAdapters
    # this class provide some schema information of a table.
    # So it doesn't need to hit the db for the schema information.
    class SchemaCache
      def initialize(connection)
        @connection = connection
      end

      def table_exists?(table_name)
        true
      end

      def columns(table_name)
        # @columns[table_name] ||= @connection.columns table_name
      end

      def columns_hash(table_name)
        # @columns_hash[table_name] ||= Hash[columns(table_name).map { |col|
        #   [col.name, col]
        # }]
        {
          id: 'id',
          title: 'title',
          content: 'content',
          author: 'author'
        }
      end
    end
  end
end

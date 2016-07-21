module TinyRecord

  # in the real scenario, active_record will load the
  # table schema from db/schema.rb when the app launch.
  # here we use this class to simplify the implementation.
  class SchemaCache
    def initialize connection
      @connection   = connection
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

module TinyRecord
  module ConnectionAdapters
    # An abstract definition of a column in a table.
    class Column
      attr_reader :name, :sql_type, :cast_type

      def initialize(name, sql_type, cast_type)
        @name      = name
        @sql_type  = sql_type
        @cast_type = cast_type
      end
    end
  end
end

module TinyRecord
  module ConnectionAdapters
    # An abstract definition of a column in a table.
    class Column
      attr_reader :name

      def initialize(name)
        @name = name
      end
    end
  end
end

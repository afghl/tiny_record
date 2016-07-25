module TinyRecord

  # handle the attributes related methods
  module Attributes
    
    module ClassMethods
      def columns
        @columns ||= connection.columns(table_name)
      end

      def column_names
        columns.map(&:name)
      end
    end
  end
end

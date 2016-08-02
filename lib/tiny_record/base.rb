module TinyRecord
  class Base
    include Querying
    include AttributeMethods

    attr_accessor :attributes

    # TODO: move these methods to another module
    class << self
      def connection
        @connection ||= ConnectionAdapters::Mysql2Adapter.new
      end

      def table_name
        name.downcase + "s"
      end

      def arel_table
        @arel_table ||= Arel::Table.new(table_name, self)
      end
    end

    def initialize(user_attributes = {})
      @attributes = user_attributes

      self.class.define_attribute_methods
    end

    def attributes_for_arel
      attributes.map do |column_name, column_key|
        [self.class.arel_table[column_name], column_key]
      end
    end
  end
end

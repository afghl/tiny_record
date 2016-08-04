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

      def _default_attributes
        @_default_attributes ||= AttributeSet.build_from_database(column_names)
      end

      def column_names
        schema_cache.columns(table_name).map(&:name)
      end

      def schema_cache
        connection.schema_cache
      end
    end

    def initialize(user_attributes = {})
      @attributes = self.class._default_attributes.dup

      self.class.define_attribute_methods

      _init_user_attributes(user_attributes)
    end

    def attributes_for_arel
      attr_column_names = self.class.column_names - ["id"]

      attr_column_names.map do |name|
        [self.class.arel_table[name], attributes[name]]
      end
    end

    private
    def _init_user_attributes(user_attributes)
      user_attributes.each do |name, value|
        send("#{name}=", value) if respond_to? "#{name}="
      end
    end
  end
end

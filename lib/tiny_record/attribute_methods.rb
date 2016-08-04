require "tiny_record/attribute_methods/read"
require "tiny_record/attribute_methods/write"

module TinyRecord

  # handle the attributes related methods
  module AttributeMethods

    def self.included(base)
      base.extend(ClassMethods)
      base.include(Read)
      base.include(Write)
      @attribute_methods_defined = false
    end

    module ClassMethods
      def columns
        @columns ||= connection.columns(table_name)
      end

      def column_names
        columns.map(&:name)
      end

      def define_attribute_methods
        return false if @attribute_methods_defined
        column_names.each { |attr_name| define_attribute_method attr_name.to_sym }
        @attribute_methods_defined = true
      end

      def define_attribute_method(attr_name)
        define_method_attribute(attr_name)
        define_method_attribute_write(attr_name)
      end

    end
  end
end

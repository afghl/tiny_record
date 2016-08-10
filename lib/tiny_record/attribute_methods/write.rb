module TinyRecord
  module AttributeMethods
    module Write
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def define_method_attribute_write(name)
          define_method("#{name}=") { |value| write_arribute(name, value) }
        end
      end

      # TODO: how to transform string into symbol elegantly
      def write_arribute(name, value)
        write_attribute_with_type_cast(name, value)
      end

      private

      def write_attribute_with_type_cast(attr_name, value)
        @attributes.write_from_user(attr_name.intern, value)
      end
    end
  end
end

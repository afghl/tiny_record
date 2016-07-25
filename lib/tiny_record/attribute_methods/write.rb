module TinyRecord
  module AttributeMethods
    module Write
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def define_method_attribute_write(name)
          define_method("#{name}=") { |value| _write_arribute(name, value) }
        end
      end

      def _write_arribute(name, value)
        value
      end
    end
  end
end

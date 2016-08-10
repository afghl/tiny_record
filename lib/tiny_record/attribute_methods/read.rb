module TinyRecord
  module AttributeMethods
    module Read
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def define_method_attribute(name)
          define_method(name) { read_attribute name }
        end
      end

      private
      def read_attribute(name)
        @attributes.fetch_value(name.intern)
      end
    end
  end
end

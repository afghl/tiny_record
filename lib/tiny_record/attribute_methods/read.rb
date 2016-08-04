module TinyRecord
  module AttributeMethods
    module Read
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def define_method_attribute(name)
          define_method(name) { _read_attribute name }
        end
      end

      private
      def _read_attribute(name)
        @attributes[name]
      end
    end
  end
end

module TinyRecord
  class Base
    include Querying
    include AttributeMethods
    include Persisitence
    include ModelSchema

    attr_accessor :attributes

    def initialize(user_attributes = {})
      @attributes = self.class._default_attributes.dup

      self.class.define_attribute_methods

      _init_user_attributes(user_attributes)
    end

    def attributes_for_arel
      attr_column_names = self.class.column_names - ["id"]

      attrs = attr_column_names.map do |name|
        [self.class.arel_table[name.intern], attributes.fetch_value(name.intern)]
      end

      attrs.select { |_, value| !value.nil? }
    end

    private

    def _init_user_attributes(user_attributes)
      user_attributes.each do |name, value|
        send("#{name}=", value) if respond_to? "#{name}="
      end
    end
  end
end

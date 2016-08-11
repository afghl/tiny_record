module TinyRecord
  module Persisitence

    def self.included(base)
      base.extend(ClassMethods)
    end

    # TODO: can update record
    def save
      _create_record
    end

    def _create_record
      im = Arel::InsertManager.new self.class.arel_table.engine
      im.into self.class.arel_table
      im.insert attributes_for_arel
      self.class.connection.execute im.to_sql
    end

    module ClassMethods

      def create(user_attributes = {})
        new_record = new user_attributes
        im = Arel::InsertManager.new arel_table.engine
        im.into arel_table

        attributes = new_record.attributes_for_arel
        if attributes.empty?
          im.values = Arel.sql(connection.empty_insert_statement_value)
        else
          im.insert new_record.attributes_for_arel
        end

        connection.execute im.to_sql
      end

    end
  end
end

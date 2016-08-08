module TinyRecord

  # This module handle the query generation.
  # After generated the correct sql, pass it to connection and execute
  module Querying
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def all
        arel_table.project Arel.sql("*")
      end

      def where(options)
        scope = arel_table
        options.each do |k, v|
          scope = scope.where(arel_table[k].eq(v))
        end
        scope.project Arel.sql("*")
      end

      def count
        query = Arel::SelectManager.new(arel_table.engine).from(self.table_name).project(Arel.star.count)
        result = @connection.exec_query(query.to_sql)
        # TODO: refactor this
        result.rows.first[result.columns.first]
      end

      def create(attributes = {})
        new_record = new attributes
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

      def delete_all
        delete_manager = Arel::DeleteManager.new arel_table.engine
        delete_manager.from arel_table
        connection.execute delete_manager.to_sql
      end
    end
  end
end

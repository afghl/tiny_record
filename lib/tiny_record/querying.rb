module TinyRecord

  # This module handle the query generation.
  # After generated the correct sql, pass it to connection and execute
  module Querying
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
        insert_manager = Arel::InsertManager.new arel_table.engine
        insert_manager.into arel_table
        insert_manager.insert new_record.attributes_for_arel
        p insert_manager.to_sql
        @connection.execute insert_manager.to_sql
      end
    end
  end
end

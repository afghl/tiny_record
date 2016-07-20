module TinyRecord
  module ConnectionAdapters

    class Mysql2Engine
      attr_accessor :connection

      def initialize
        @connection = Mysql2Adapter.new
      end

    end

    class Mysql2Adapter

      def initialize
        @client = Mysql2::Client.new(:host => "localhost", :username => "root")
      end

      def visitor
        @visitor ||= Arel::Visitors::MySQL.new self
      end
      
      def quote_table_name arg
        arg
      end

      def quote_column_name arg
        arg
      end

    end

  end
end

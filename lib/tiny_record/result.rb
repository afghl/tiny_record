module TinyRecord
  
  # This class encapsulates a Result returned from calling +exec_query+ on any
  # database connection adapter.
  class Result
    attr_accessor :columns, :rows

    def initialize(columns, rows)
      @columns = columns
      @rows    = rows
    end

    # def [](column_name)
    #   @rows[column_name]
    # end
  end
end

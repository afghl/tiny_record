require "arel"
require "mysql2"

require "tiny_record/version"
require "tiny_record/engine"
require "tiny_record/connection_adapters/column"
require "tiny_record/connection_adapters/schema_cache"
require "tiny_record/connection_adapters/mysql2_adapter"
require "tiny_record/result"
require "tiny_record/querying"
require "tiny_record/attributes"
require "tiny_record/base"

# # for debugging
# begin
#   require "pry"
# rescue LoadError
# end

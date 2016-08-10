
# for debugging
begin
  require "pry"
rescue LoadError
end
require "arel"
require "mysql2"

require "tiny_record/version"
require "tiny_record/engine"
require "tiny_record/connection_adapters/column"
require "tiny_record/connection_adapters/schema_cache"
require "tiny_record/connection_adapters/abstract_adapter"
require "tiny_record/connection_adapters/mysql2_adapter"
require "tiny_record/result"
require "tiny_record/querying"
require "tiny_record/type/integer"
require "tiny_record/type/string"
require "tiny_record/type/value"
require "tiny_record/type/type_map"
require "tiny_record/attribute_methods"
require "tiny_record/attribute_set"
require "tiny_record/model_schema"
require "tiny_record/base"

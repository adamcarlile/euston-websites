module Euston
module Websites
module ApiCommandRequestParsing
  class BatchParser < AbstractParser
    def initialize request, &block
      super request
      @transformer = block
    end

    def transform_hash_to_commands hash
      @transformer.call hash
    end
  end
end
end
end

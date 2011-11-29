module Euston
module Websites
module ApiCommandRequestParsing
  class DiscreteParser < AbstractParser
    def initialize request, params, command_type, command_id = nil
      super request
      @command_id = command_id || params[:id]
      @command_type = command_type
    end

    def transform_hash_to_commands hash
      hash = hash.recursive__symbolize__keys!

      callback :preparing_hash, hash

      command = @command_type.new hash
      command.id = @command_id
      command
    end
  end
end
end
end

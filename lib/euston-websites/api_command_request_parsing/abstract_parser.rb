module Euston
module Websites
module ApiCommandRequestParsing
  class AbstractParser
    include Hollywood

    def initialize request
      @body = request.body.read
    end

    def parse
      valid = true

      begin
        commands = [transform_hash_to_commands(ActiveSupport::JSON.decode(@body))].flatten
      rescue StandardError => e
        callback :not_parseable
        valid = false
      end

      return unless valid

      invalid_commands = commands.reject { |c| c.valid? }

      if invalid_commands.any?
        callback :invalid, invalid_commands
      else
        callback :valid, commands
      end
    end
  end
end
end
end

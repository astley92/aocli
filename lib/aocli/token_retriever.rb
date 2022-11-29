require("yaml")

module Aocli
  module TokenRetriever
    TOKEN_LOCATION = "~/.aocli_config"

    module_function

    def call
      return unless file_exists?

      contents = YAML.load_file(TOKEN_LOCATION)
      contents["token"]
    end

    def file_exists?
      File.file?(TOKEN_LOCATION)
    end
  end
end

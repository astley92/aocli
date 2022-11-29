require("yaml")

module Aocli
  module TokenRetriever
    module_function

    def call
      return unless file_exists?

      config = YAML.load_file(Aocli::Values::CONFIG_FILE_PATH)
      config["token"]
    end

    def file_exists?
      File.file?(Aocli::Values::CONFIG_FILE_PATH)
    end
  end
end

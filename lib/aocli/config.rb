module Aocli
  module Config
    module_function

    def add_config(key:, value:)
      config = load_config.merge({key => value})
      File.write(Aocli::Values::CONFIG_FILE_PATH, config.to_yaml)
    end

    def value_for(key)
      load_config[key]
    end

    def load_config
      unless File.exist?(Aocli::Values::CONFIG_FILE_PATH)
        Aocli::FileUtils.touch_file(Aocli::Values::CONFIG_FILE_PATH)
      end

      YAML.load_file(Aocli::Values::CONFIG_FILE_PATH, fallback: {})
    end

    def remove_config(key)
      config = load_config

      File.write(Aocli::Values::CONFIG_FILE_PATH, config.except(key).to_yaml)
    end
  end
end

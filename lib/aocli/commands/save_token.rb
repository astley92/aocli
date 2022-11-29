module Aocli
  module Commands
    module SaveToken
      def self.run!(options)
        Aocli::FileUtils.touch_file(Aocli::Values::CONFIG_FILE_PATH)
        File.write(Aocli::Values::CONFIG_FILE_PATH, {token: options[:token]}.to_yaml)
      end
    end
  end
end

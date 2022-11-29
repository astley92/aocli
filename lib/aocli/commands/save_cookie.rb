module Aocli
  module Commands
    module SaveCookie
      def self.run!(options)
        Aocli::FileUtils.touch_file(Aocli::Values::CONFIG_FILE_PATH)
        File.write(Aocli::Values::CONFIG_FILE_PATH, {cookie: options[:cookie]}.to_yaml)
      end
    end
  end
end

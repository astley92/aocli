module Aocli
  module Commands
    module SaveCookie
      def self.run!(options)
        Aocli::FileUtils.touch_file(Aocli::Values::CONFIG_FILE_PATH)
        File.write(Aocli::Values::CONFIG_FILE_PATH, {cookie: options[:cookie]}.to_yaml)

        puts <<~MSG
          ### Cookie saved to #{Aocli::Values::CONFIG_FILE_PATH} ###

          If you ever need to reset this cookie, you can use the save cookie command again
          or simply edit that file.
        MSG
      end
    end
  end
end

module Aocli
  module Commands
    module RemoveCookie
      def self.run!(_options = nil)
        Aocli::Config.remove_config(:cookie)

        puts <<~MSG
          ### #{Aocli::Values::CONFIG_FILE_PATH} file has been removed ###
        MSG
      end
    end
  end
end

module Aocli
  module Commands
    module RemoveCookie
      def self.run!(_options = nil)
        File.delete(Aocli::Values::CONFIG_FILE_PATH)

        puts <<~MSG
          ### #{Aocli::Values::CONFIG_FILE_PATH} file has been removed ###
        MSG
      end
    end
  end
end

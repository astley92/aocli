module Aocli
  module Commands
    module RemoveCookie
      def self.run!(_options = nil)
        Aocli::Config.remove_config(:cookie)

        puts <<~MSG
          ### Cookie has been removed ###
        MSG
      end
    end
  end
end

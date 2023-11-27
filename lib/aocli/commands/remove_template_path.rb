module Aocli
  module Commands
    module RemoveTemplatePath
      def self.run!(_options = nil)
        current_path = Aocli::Config.value_for(:template_path)
        Aocli::Config.remove_config(:template_path)

        puts <<~MSG
          ### '#{current_path} is no longer set as your template file ###
        MSG
      end
    end
  end
end

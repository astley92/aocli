module Aocli
  module Commands
    module SetTemplatePath
      def self.run!(options)
        Aocli::Config.add_config(key: :template_path, value: options[:template_path])

        puts <<~MSG
          ### The template at '#{options[:template_path]}' will now be used ###
        MSG
      end
    end
  end
end

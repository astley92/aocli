module Aocli
  module Commands
    class StartDay
      def self.run!(options)
        new(**options).run!
      end

      def initialize(date:, output_destination:)
        @date = date
        @output_destination = output_destination
      end

      def run!
        directory = create_dir_path
        create_files(directory)
      end

      private
      attr_reader :date, :output_destination

      def create_dir_path
        FileUtils.mkdir_p(File.join(output_destination, date.year.to_s, "day_#{date.day}"))
      end

      def create_files(directory)
        File.write(File.join(directory, "main.rb"), Aocli::Content::Main.content)

        File.write(File.join(directory, "input.txt"), <<~CONT)
          Inputs go here
        CONT
      end
    end
  end
end

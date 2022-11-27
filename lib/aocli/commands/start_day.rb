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
        ::FileUtils.mkdir_p(File.join(output_destination, date.year.to_s, "day_#{date.day}"))
      end

      def create_files(directory)
        create_main_file(directory)
        create_input_file(directory)
      end

      def create_main_file(directory)
        problem_description = Aocli::AdventOfCode.get_problem_description(
          year: date.year,
          day: date.day,
        )

        main_content = Aocli::FileUtils.insert_lines(
          Aocli::FileUtils.wrap_lines(problem_description).split("\n").map { _1 == "" ? "#" : "# #{_1}" },
          into: Aocli::Content::Main.content,
          after: "##### Part One Description #####",
        )

        File.write(File.join(directory, "main.rb"), main_content)
      end

      def create_input_file(directory)
        File.write(File.join(directory, "input.txt"), <<~CONT)
          Inputs go here
        CONT
      end
    end
  end
end

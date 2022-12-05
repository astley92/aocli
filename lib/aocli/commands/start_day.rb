module Aocli
  module Commands
    class StartDay
      def self.run!(options)
        new(
          date: options[:date],
          output_destination: options[:output_destination],
        ).run!
      end

      def initialize(date:, output_destination:)
        @date = date
        @output_destination = output_destination
        @main_file_path = File.join(output_destination, date.year.to_s, "day_#{date.day}", "main.rb")
        @input_file_path = File.join(output_destination, date.year.to_s, "day_#{date.day}", "input.txt")
      end

      def run!
        Aocli::FileUtils.touch_file(main_file_path)
        Aocli::FileUtils.touch_file(input_file_path)
        File.write(main_file_path, main_content)
        File.write(input_file_path, input_content)
      end

      private
      attr_reader :date, :output_destination, :main_file_path, :input_file_path

      def main_content
        problem_description = Aocli::AdventOfCode.get_problem_description(
          year: date.year,
          day: date.day,
        )

        content = Aocli::FileUtils.insert_lines(
          Aocli::FileUtils.wrap_lines(problem_description).split("\n").map { _1 == "" ? "#" : "# #{_1}" },
          into: File.read(File.join(__dir__, "../content/main.txt")),
          after: "##### Part One Description #####",
        )

        Aocli::FileUtils.replace_line(
          content,
          "# __load_input__",
          'input = File.read(__FILE__.gsub("main.rb", "input.txt"))'
        )
      end

      def input_content
        Aocli::AdventOfCode.get_problem_inputs(
          year: date.year,
          day: date.day,
        )
      end
    end
  end
end

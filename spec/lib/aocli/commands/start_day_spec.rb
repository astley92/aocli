RSpec.describe Aocli::Commands::StartDay do
  describe ".run!" do
    subject(:run) { described_class.run!(options) }
    let(:options) { {date: Date.parse("2021-12-01"), output_destination: "./spec/tmp/"} }

    let(:expected_ruby) do
      <<~RUBY
        ##### Part One Description #####

        class Solution
          def self.run!(input)
            new(parse_input(input)).run!
          end

          def self.parse_input
            puts "Parse inputs here"
          end

          def initialize
            @input = input
          end

          def run!
            puts "Solution code goes here"
          end
        end

        input = File.read("./input.txt")
        Solution.run!(input)
      RUBY
    end

    it "creates the expected files" do
      run

      expect(File.read("./spec/tmp/2021/day_1/main.rb")).to eq(expected_ruby)
      expect(File.read("./spec/tmp/2021/day_1/input.txt")).to eq("Inputs go here\n")
    end
  end
end

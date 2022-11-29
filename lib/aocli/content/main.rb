module Aocli
  module Content
    module Main
      def self.content
        <<~RUBY
          ##### Part One Description #####

          class Solution
            def initialize
              @input = input
            end

            def self.run!(input)
              new(parse_input(input)).run!
            end

            def self.parse_input
              puts "Parse inputs here"
            end

            def run!
              puts "Solution code goes here"
            end
          end

          input = File.read("./input.txt")
          puts Solution.run!(input)
        RUBY
      end
    end
  end
end

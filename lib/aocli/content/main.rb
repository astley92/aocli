module Aocli
  module Content
    module Main
      def self.content
        <<~RUBY
          ##### Part One Description #####

          class Solution
            attr_accessor :input
            def initialize(input)
              @input = input
            end

            def self.run!(input)
              new(parse_input(input)).run!
            end

            def self.parse_input(input)
              # Parse input
              input
            end

            def run!
              # Solve input
            end
          end

          # __load_input__
          puts Solution.run!(input)
        RUBY
      end
    end
  end
end

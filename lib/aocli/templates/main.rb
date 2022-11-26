module Aocli
  module Content
    module Main
      module_function

      def content
        <<~RUBY
          require("byebug")

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

          Solution.run!(input)
        RUBY
      end
    end
  end
end

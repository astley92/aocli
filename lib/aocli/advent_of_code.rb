require("aocli/advent_of_code/client")

module Aocli
  module AdventOfCode
    module_function

    def get_problem_description(...)
      instance.get_problem_description(...)
    end

    def instance
      @instance ||= Aocli::AdventOfCode::Client.new
    end
  end
end

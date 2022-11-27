module Aocli
  module Cli
    YEARS = [2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015]
    DAYS = (1..25).to_a
    module_function

    def call
      prompt = TTY::Prompt.new

      year = prompt.select("What year", *YEARS)
      day = prompt.select("What day", *DAYS)

      {
        date: Date.new(year, 12, day),
        output_destination: "."
      }
    end
  end
end

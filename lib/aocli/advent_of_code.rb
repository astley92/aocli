require("aocli/advent_of_code/client")

module Aocli
  module AdventOfCode
    module_function

    def get_problem_description(year:, day:)
      while true
        current_time = DateTime.now.new_offset("EST")
        live_time = DateTime.new(year, 12, day, 0, 0, 0, "EST")
        time_to_wait = ((live_time - current_time) * 24 * 60 * 60).to_i
        break if time_to_wait < 1

        print("\rWaiting #{time_to_wait} seconds before fetching...".ljust(40, " "))
        sleep(1)
      end

      response = nil
      attempts = 0
      while true
        print("\rFetching problem and input attempt ##{attempts}".ljust(40, " "))
        response = client.get_problem_description(year: year, day: day)

        break unless response.should_retry?
        print("\rSleeping".ljust(40, " "))
        sleep(1)
      end
      raise(StandardError, "Something went wrong: #{response.inspect}") unless response.ok?

      html = Nokogiri::HTML(response.body)
      article = html.css("article").first
      article.search("p,h2").each { |element| element.after("\n") }
      article.text
    end

    def get_problem_inputs(year:, day:)
      response = client.get_problem_inputs(year: year, day: day)
      unless response.ok?
        raise(StandardError, "unable to fetch input - #{response.inspect}")
      end

      response.body
    end

    def client
      @client ||= Aocli::AdventOfCode::Client.new
    end
  end
end

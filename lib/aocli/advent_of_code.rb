require("aocli/advent_of_code/client")

module Aocli
  module AdventOfCode
    module_function

    def get_problem_description(year:, day:)
      response = nil
      while true
        response = client.get_problem_description(year: year, day: day)

        break unless response.should_retry?
        sleep 10
      end
      raise(StandardError, "Something went wrong: #{response.inspect}") unless response.ok?

      html = Nokogiri::HTML(response.body)
      article = html.css("article").first
      article.search("p,h2").each { |element| element.after("\n") }
      article.text
    end

    def client
      @client ||= Aocli::AdventOfCode::Client.new
    end
  end
end

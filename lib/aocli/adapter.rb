class Aocli::Adapter
  class << self
    def fetch_input(year:, day:)
      token = Aocli::Commands::FetchToken.run!
      return not_found_string if token.nil?

      response = Faraday.get("https://adventofcode.com/#{year.to_s}/day/#{day.to_s}/input", {}, {"cookie" => token_string(token)})
      return too_early_string if response.body.include? "Please don't repeatedly request this endpoint before it unlocks!"
      return something_wrong_string unless response.status == 200

      response.body
    end

    def fetch_problem_html(year:, day:)
      response = Faraday.get("https://adventofcode.com/#{year.to_s}/day/#{day.to_s}")
      return too_early_string if response.body.include? "Please don't repeatedly request this endpoint before it unlocks!"
      return something_wrong_string unless response.status == 200

      problem_html = Nokogiri::HTML.parse(response.body).css("//article").children.to_html
    end

    def submit_answer(year:, day:, level:, answer:)
      # TODO: Return :too_soon if Time.now - most recent submit attempt is less than
      # current timeout period.
      token = Aocli::Commands::FetchToken.run!
      return :no_token if token.nil?

      response = Faraday.post(
        "https://adventofcode.com/#{year.to_s}/day/#{day.to_s}/answer",
        {
          level: level.to_s,
          answer: answer.to_s,
        },
        {
          "cookie" => token_string(token)
        }
      )
      return too_early_string if response.body.include? "Please don't repeatedly request this endpoint before it unlocks!"
      return something_wrong_string unless response.status == 200

      if response.body.to_s.include? "That's not the right answer"
        # TODO: Store most recent submit attempt
        return :incorrect
      elsif response.body.to_s.include? "You gave an answer too recently"
        # TODO: Prevent this from being hit by using the most recent submit attempt value
        return :too_soon
      else
        return :correct
        # TODO: Need to re fetch the problem code here
      end
    end

    private

    def too_early_string
      ""
    end

    def not_found_string
      "Your token was not able to be found and so this file could not be generated."
    end

    def token_string(token)
      "session=#{token}"
    end

    def something_wrong_string
      "Something went wrong while getting your input and so this file could be generated."
    end
  end
end

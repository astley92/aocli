class Aocli::CLI
  class << self
    def start
      token = Aocli::Commands::FetchToken.run!
      prompt = TTY::Prompt.new
      options = [
        create_new_day_option(available: !token.nil?),
        set_token_option,
      ]
      choice = prompt.select("What would you like to do?", options)

      case choice
      when "Start new day"
        # TODO: Set sensible year and day validations. Something like
        # max_day = 25, max_year = the year that includes the most
        # recent December.

        year = prompt.ask("Enter the year:") do |q|
          q.validate(/\A\d{4}\z/, "Please enter a valid year")
          q.convert(:int)
        end
        day = prompt.ask("Enter the day:") do |q|
          q.validate(/\A\d{1,2}\z/, "Please enter a valid day 1-25")
          q.convert(:int)
        end
        Aocli::Commands::CreateNewDay.run(year: year, day: day)
      when "Set session token"
        Aocli::Commands::SetToken.run
      else
        raise(NotImplementedError)
      end
    end

    def create_new_day_option(available: true)
      option = {name: "Start new day", value: "Start new day"}
      if !available
        option[:disabled] = "(You'll need to set your token)"
      end
      option
    end

    def set_token_option
      {name: "Set session token", value: "Set session token"}
    end
  end
end

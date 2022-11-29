
require"byebug"
module Aocli
  class Cli
    def initialize
      @options = {token: Aocli::TokenRetriever.call}
      @prompt = TTY::Prompt.new
    end

    def run
      prompt_for_command
      get_all_command_options
      # Aocli::Commands::StartDay
      # Aocli::Commands::SaveToken
      options[:command].constantize.run!(options)
    end

    private
    attr_accessor :options, :prompt
    attr_reader :token

    def prompt_for_command
      options[:command] = prompt.select("What would you like to do?", command_options)
    end

    def get_all_command_options
      case options[:command]
      when "Aocli::Commands::StartDay"
        set_start_day_options
      when "Aocli::Commands::SaveToken"
        set_save_token_options
      else
        raise NotImplementedError, "Can't handle that command: #{command_klass}"
      end
    end

    def command_options
      @command_options ||= [
        {name: "Save Token", value: "Aocli::Commands::SaveToken"},
        requires_token({name: "Start day", value: "Aocli::Commands::StartDay"}),
      ]
      # TODO:
      # requires_token({name: "Remove token file", value: "Aocli::Commands::RemoveTokenFile"}),
    end

    def requires_token(hash)
      hash.merge(options[:token] ? {} : {disabled: "(No token has been set yet)"})
    end

    def set_start_day_options
      year = prompt.select("Which Year?", Aocli::Values::START_DAY_YEARS)
      day = prompt.select("Which Day?", Aocli::Values::START_DAY_DAYS)
      options[:date] = Date.new(year, 12, day)
      options[:output_destination] = "./"
    end

    def set_save_token_options
      options[:token] = prompt.ask("Paste your token and it will be saved:")
    end
  end
end

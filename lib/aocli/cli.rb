module Aocli
  class Cli
    def initialize
      @options = { cookie: Aocli::Config.value_for(:cookie) }
      @prompt = TTY::Prompt.new
    end

    def run
      prompt_for_command
      prompt_command_options
      # Aocli::Commands::StartDay
      # Aocli::Commands::SaveCookie
      options[:command].constantize.run!(options)
    end

    private

    attr_accessor :options, :prompt
    attr_reader :cookie

    def prompt_for_command
      options[:command] = prompt.select("What would you like to do?", command_options)
    end

    def prompt_command_options
      case options[:command]
      when "Aocli::Commands::StartDay"
        set_start_day_options
      when "Aocli::Commands::SaveCookie"
        set_save_cookie_options
      when "Aocli::Commands::RemoveCookie"
        nil
      when "Exit"
        exit
      else
        raise NotImplementedError, "Can't handle that command: #{command_klass}"
      end
    end

    def command_options
      @command_options ||= [
        requires_cookie({name: "Start day", value: "Aocli::Commands::StartDay"}),
        {name: "Save Cookie", value: "Aocli::Commands::SaveCookie"},
        requires_cookie({name: "Remove cookie file", value: "Aocli::Commands::RemoveCookie"}),
        {name: "Exit", value: "Exit"},
      ]
    end

    def requires_cookie(hash)
      hash.merge(options[:cookie] ? {} : {disabled: "(No cookie has been set yet)"})
    end

    def set_start_day_options
      year = prompt.select("Which Year?", Aocli::Values::START_DAY_YEARS.reverse)
      day = prompt.select("Which Day?", Aocli::Values::START_DAY_DAYS)
      options[:date] = Date.new(year, 12, day)
      options[:output_destination] = "./"
    end

    def set_save_cookie_options
      options[:cookie] = prompt.ask("Paste your cookie and it will be saved:")
    end
  end
end

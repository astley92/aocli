require "byebug"

module Aocli
  class Cli
    def initialize
      @options = Aocli::Config.load_config
      @prompt = TTY::Prompt.new
    end

    def run
      prompt_for_command
      prompt_command_options
      # Aocli::Commands::StartDay
      # Aocli::Commands::SaveCookie
      # Aocli::Commands::RemoveCookie
      # Aocli::Commands::SetTemplatePath
      # Aocli::Commands::RemoveTemplatePath
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
      when "Aocli::Commands::SetTemplatePath"
        set_template_path_options
      when "Aocli::Commands::RemoveCookie", "Aocli::Commands::RemoveTemplatePath"
        nil
      when "Exit"
        exit
      else
        raise NotImplementedError, "Can't handle that command: #{command_klass}"
      end
    end

    def command_options
      @command_options ||= [
        requires_config(:cookie, {name: "Start day", value: "Aocli::Commands::StartDay"}),
        {name: "Save Cookie", value: "Aocli::Commands::SaveCookie"},
        requires_config(:cookie, {name: "Unset cookie", value: "Aocli::Commands::RemoveCookie"}),
        {name: set_template_prompt, value: "Aocli::Commands::SetTemplatePath"},
        requires_config(:template_path, {name: "Unset template file", value: "Aocli::Commands::RemoveTemplatePath"}),
        {name: "Exit", value: "Exit"},
      ]
    end

    def requires_config(required_config, hash)
      hash.merge(options[required_config] ? {} : {disabled: "(No #{required_config} has been set yet)"})
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

    def set_template_path_options
      options[:template_path] = prompt.ask("Paste the full file path to your template file:")
    end

    def set_template_prompt
      base_prompt = "Set Template File"
      if options[:template_path]
        base_prompt += " -> Currently set to '#{options[:template_path]}'"
      end
      base_prompt
    end
  end
end

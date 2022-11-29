module Aocli
  module Cli
    def self.call(token:)
      prompt = TTY::Prompt.new

      command_options = [
        {name: "Set Token", value: :set_token},
        {name: "Start day", value: :start_day}.merge(token ? {} : {disabled: "(No token has been set yet)"}),
        {name: "Remove token file", value: :remove_token_file}.merge(token ? {} : {disabled: "(No token has been set yet)"}),
      ]

      choice = prompt.select("What would you like to do?", command_options)

      {token: token, command: choice}
    end
  end
end

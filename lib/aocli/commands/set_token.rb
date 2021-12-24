# TODO: Convert to active interaction
class Aocli::Commands::SetToken
  class << self
    def run
      file_path = Aocli::Values::Token::TOKEN_PATH
      prompt = TTY::Prompt.new
      token = prompt.ask("Enter your advent of code session token:")
      File.write(file_path, token)
    end
  end
end

# TODO: Convert to active interaction
class Aocli::Commands::FetchToken
  class << self
    def run
      file_path = Aocli::Values::Token::TOKEN_PATH
      if File.exist?(file_path)
        return File.read(file_path).strip()
      else
        return nil
      end
    end
  end
end

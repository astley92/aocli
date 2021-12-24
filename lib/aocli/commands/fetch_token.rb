class Aocli::Commands::FetchToken < ActiveInteraction::Base

  def execute
    file_path = Aocli::Values::Token::TOKEN_PATH
    if File.exist?(file_path)
      return File.read(file_path).strip()
    else
      return nil
    end
  end
end

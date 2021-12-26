require("zeitwerk")
require("active_interaction")
require("tty-prompt")
require("faraday")

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect(
  "cli" => "CLI"
)
loader.setup

module Aocli
  extend self

  def start_cli
    Aocli::CLI.start
  end
end

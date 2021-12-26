require("active_interaction")
require("faraday")
require("kramdown")
require("nokogiri")
require("tty-prompt")
require("zeitwerk")

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

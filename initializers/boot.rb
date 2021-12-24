require "bundler/setup"
require "aocli"
Bundler.require(:default, :development)

loader = Zeitwerk::Loader.new
loader.push_dir("lib")
loader.inflector.inflect(
  "cli" => "CLI"
)
loader.setup

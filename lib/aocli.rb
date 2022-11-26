# frozen_string_literal: true

require("aocli/version")
require("aocli/cli")
require("aocli/commands/start_day")

require("date")
require("tty-prompt")

module Aocli
  class Error < StandardError; end

  def self.hello_world
    puts "Hello, world!"
  end
end

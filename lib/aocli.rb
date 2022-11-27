# frozen_string_literal: true

require("aocli/advent_of_code")
require("aocli/cli")
require("aocli/commands/start_day")
require("aocli/file_utils")
require("aocli/content/main")
require("aocli/version")

require("date")
require("fileutils")
require("tty-prompt")
require("nokogiri")

module Aocli
  class Error < StandardError; end

  def self.hello_world
    puts "Hello, world!"
  end
end

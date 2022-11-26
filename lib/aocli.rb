# frozen_string_literal: true

require "aocli/version"
require "aocli/cli"

module Aocli
  class Error < StandardError; end

  def self.hello_world
    puts "Hello, world!"
  end
end

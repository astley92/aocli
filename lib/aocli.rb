# frozen_string_literal: true

require_relative "aocli/version"

module Aocli
  class Error < StandardError; end

  def self.hello_world
    puts "Hello, world!"
  end
end

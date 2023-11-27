# frozen_string_literal: true

require("aocli/advent_of_code")
require("aocli/cli")
require("aocli/config")
require("aocli/commands/set_template_path")
require("aocli/commands/save_cookie")
require("aocli/commands/remove_cookie")
require("aocli/commands/remove_template_path")
require("aocli/commands/start_day")
require("aocli/file_utils")
require("aocli/version")
require("aocli/values")

require("fileutils")
require("tty-prompt")
require("nokogiri")
require("active_support/core_ext/string")

module Aocli
end

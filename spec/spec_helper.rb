# frozen_string_literal: true

require("aocli")
require("byebug")
require("vcr")

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/cassettes"
  config.hook_into :faraday
  config.filter_sensitive_data('<ADVENT_OF_CODE_COOKIE>') { |interaction|
    interaction.request.headers['Cookie'][0]
  }
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.after do
    Dir.glob("./spec/tmp/*").each { FileUtils.remove_dir(_1) }
  end
end

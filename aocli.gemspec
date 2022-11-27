# frozen_string_literal: true

require_relative "lib/aocli/version"

Gem::Specification.new do |spec|
  spec.name = "aocli"
  spec.version = Aocli::VERSION
  spec.authors = ["Blake Astley"]
  spec.email = ["astley92@hotmail.com"]

  spec.summary = "Command line application to retrieve advent of code challenges"
  spec.description = "Command line application to retrieve advent of code challenges"
  spec.homepage = "https://github.com/astley92/aocli"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage + "/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_runtime_dependency "date"
  spec.add_runtime_dependency "fileutils"
  spec.add_runtime_dependency "nokogiri"
  spec.add_runtime_dependency "tty-prompt"
  spec.add_runtime_dependency "faraday"

  spec.add_development_dependency "byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

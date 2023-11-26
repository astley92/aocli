# frozen_string_literal: true

require_relative "lib/aocli/version"

Gem::Specification.new do |spec|
  spec.name = "aocli"
  spec.version = Aocli::VERSION
  spec.authors = ["Blake Astley"]
  spec.email = ["astley92@hotmail.com"]

  spec.summary = "Command line application to retrieve advent of code challenges"
  spec.description = "Command line application to retrieve advent of code challenges and create boilerplate solution code"
  spec.homepage = "https://github.com/astley92/aocli"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage + "/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency("activesupport", "~> 7.0.8")
  spec.add_runtime_dependency("faraday", "~> 2.7")
  spec.add_runtime_dependency("nokogiri", "~> 1.13")
  spec.add_runtime_dependency("tty-prompt", "~> 0.23.1")

  spec.add_development_dependency("byebug", "~> 11.0")
  spec.add_development_dependency("rake", "~> 13.0")
  spec.add_development_dependency("rspec", "~> 3.0")
  spec.add_development_dependency("rubocop", "~> 1.0")
  spec.add_development_dependency("timecop", "~> 0.9")
  spec.add_development_dependency("vcr", "~> 6.1")
end

require_relative 'lib/aocli/version'

Gem::Specification.new do |spec|
  spec.name          = "aocli"
  spec.version       = Aocli::VERSION
  spec.authors       = ["Blake Astley"]
  spec.email         = ["astley92@hotmail.com"]

  spec.summary       = "A simple and easy to use cli that quickly creates boilerplate files and code for completing Advent of Code challenges"
  spec.description   = "A simple and easy to use cli that quickly creates boilerplate files and code for completing Advent of Code challenges"
  spec.homepage      = "https://github.com/astley92/aocli"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/astley92/aocli"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency("byebug")
  spec.add_development_dependency("rake")
  spec.add_development_dependency("rspec")

  spec.add_dependency("active_interaction")
  spec.add_dependency("faraday")
  spec.add_dependency("kramdown")
  spec.add_dependency("nokogiri")
  spec.add_dependency("tty-prompt")
  spec.add_dependency("zeitwerk")
end

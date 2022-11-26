# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"
RuboCop::RakeTask.new

task default: %i[spec rubocop]

task :build do
  system "gem build aocli.gemspec"
end

task :install => :build do
  system "gem install aocli-" + Aocli::VERSION + ".gem"
end

task :publish => :build do
  system "gem push aocli-" + Aocli::VERSION + ".gem"
end

task :clean do
  system "rm *.gem"
end

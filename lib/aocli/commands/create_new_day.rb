class Aocli::Commands::CreateNewDay < ActiveInteraction::Base
  include Aocli::Templates

  integer :year
  integer :day

  def execute
    base_dir = create_directories
    create_files(base_dir)
  end

  private

  def create_directories
    base_dir = Dir.pwd
    year_dir = create_year_dir(base_dir, year)
    create_day_dir(year_dir, day)
  end

  def create_files(base_dir)
    problem_html = Aocli::Adapter.fetch_problem_html(year: year, day: day)
    markdown = Kramdown::Document.new(problem_html, html_to_native: true).to_kramdown

    File.write(File.join(base_dir, "problem.md"), markdown)
    File.write(File.join(base_dir, "part_one.rb"), solution_content(base_dir))
    File.write(File.join(base_dir, "part_two.rb"), solution_content(base_dir))
    File.write(File.join(base_dir, "inputs.txt"), Aocli::Adapter.fetch_input(year: year, day: day))
    File.write(File.join(base_dir, "test_inputs.txt"), "")
  end

  def create_year_dir(base_dir, year)
    year_dir = File.join(base_dir, year.to_s)
    return year_dir if File.directory?(year_dir)

    Dir.mkdir(year_dir)
    year_dir
  end

  def create_day_dir(base_dir, day)
    day_dir = File.join(base_dir, day.to_s)
    return day_dir if File.directory?(day_dir)

    Dir.mkdir(day_dir)
    day_dir
  end
end

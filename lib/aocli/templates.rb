module Aocli::Templates
  def solution_content(base_dir)
    <<~TEMPLATE
    inputs = File.read("#{File.join(base_dir, "test_inputs.txt")}")

    puts inputs
    TEMPLATE
  end
end

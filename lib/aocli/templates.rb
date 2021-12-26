module Aocli::Templates
  def solution_content(base_dir)
    <<~TEMPLATE
    require("aocli")
    inputs = File.read("#{File.join(base_dir, "test_inputs.txt")}")

    puts inputs

    # Aocli.submit_answer(answer_for_this_part)
    TEMPLATE
  end
end

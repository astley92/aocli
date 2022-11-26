module Aocli::Cli
  module_function

  def call
    prompt = TTY::Prompt.new
    run_for_current_day = prompt.yes?("Run for the current day?")

    raise NotImplementedError unless run_for_current_day

    {
      date: Date.today,
    }
  end
end

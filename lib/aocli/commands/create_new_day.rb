class Aocli::Commands::CreateNewDay < ActiveInteraction::Base
  integer :year
  integer :day

  def execute
    byebug
  end
end

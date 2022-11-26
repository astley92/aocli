RSpec.describe Aocli::Commands::StartDay do
  describe ".run!" do
    subject(:run) { described_class.run!(options) }
    let(:options) { {date: Date.parse("2021-12-01"), output_destination: "./spec/tmp/"} }

    it "creates the expected files" do
      run

      expect(File.read("./spec/tmp/2021/day_1/main.rb")).to eq("Hey there\n")
      expect(File.read("./spec/tmp/2021/day_1/input.txt")).to eq("Inputs go here\n")
    end
  end
end

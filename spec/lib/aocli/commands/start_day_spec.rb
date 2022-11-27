RSpec.describe Aocli::Commands::StartDay do
  describe ".run!" do
    subject(:run) { described_class.run!(options) }
    let(:options) { {date: Date.parse("2021-12-01"), output_destination: "./spec/tmp/"} }

    let(:expected_ruby) { File.read("spec/fixtures/main_files/2021_day_1.rb") }

    it "creates the expected files" do
      VCR.use_cassette("start_day_spec") do
        run
      end

      expect(File.read("./spec/tmp/2021/day_1/main.rb").strip).to eq(expected_ruby.strip)
      expect(File.read("./spec/tmp/2021/day_1/input.txt")).to eq("Inputs go here\n")
    end
  end
end

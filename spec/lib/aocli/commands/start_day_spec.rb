RSpec.describe Aocli::Commands::StartDay do
  before do
    stub_const("Aocli::Values::CONFIG_FILE_PATH", "spec/fixtures/.aocli_config")
  end
  describe ".run!" do
    subject(:run) { described_class.run!(options) }
    let(:options) { {date: Date.parse("2021-12-01"), output_destination: "./spec/tmp/"} }

    let(:expected_ruby) { File.read("spec/fixtures/main_files/2021_day_1.rb") }
    let(:expected_input) { File.read("spec/fixtures/inputs/2021_day_1.txt") }

    it "creates the expected files" do
      VCR.use_cassette("start_day_spec") do
        run
      end

      expect(File.read("./spec/tmp/2021/day_1/main.rb").strip).to eq(expected_ruby.strip)
      expect(File.read("./spec/tmp/2021/day_1/input.txt")).to eq(expected_input)
    end

    context "when its prior to the requested date" do
      before do
        Timecop.travel(DateTime.parse("2021-11-30T23:59:56EST"))
        allow(Aocli::AdventOfCode).to receive(:sleep)
        Timecop.scale(100)
      end

      it "Shows the user a countdown" do
        VCR.use_cassette("start_day_spec") do
          expect { run }.to output(include(
            "Waiting 3 seconds before fetching...",
            "Waiting 2 seconds before fetching...",
            "Waiting 1 seconds before fetching...",
          )).to_stdout
        end
      end
    end

    context "when the problem can't be fetched within #{Aocli::AdventOfCode::MAX_RETRY_COUNT} retries" do
      before do
        response_to_return = Aocli::AdventOfCode::Response.new(
          status: 400,
          should_retry: true,
          body: "",
        )
        allow_any_instance_of(Aocli::AdventOfCode::Client).to receive(:get_problem_description) do
          response_to_return
        end
      end

      it "raises an exception" do
        expect(Aocli::AdventOfCode).to receive(:sleep).exactly(5).times
        expect { run }.to raise_error(StandardError, include("Unable to fetch todays problem"))
      end
    end
  end
end

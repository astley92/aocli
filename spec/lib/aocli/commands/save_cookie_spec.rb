RSpec.describe Aocli::Commands::SaveCookie do
  before do
    stub_const("Aocli::Values::CONFIG_FILE_PATH", "spec/tmp/files/.aocli_config")
  end

  describe ".run!" do
    subject(:run_command) { described_class.run!(options) }
    let(:options) { {cookie: "this is my cookie"} }

    it "saves the cookie in the aocli_config file" do
      expect(File).to receive(:write).with("spec/tmp/files/.aocli_config", {cookie: "this is my cookie"}.to_yaml).and_call_original

      run_command
    end
  end
end

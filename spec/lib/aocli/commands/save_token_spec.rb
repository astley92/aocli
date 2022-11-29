RSpec.describe Aocli::Commands::SaveToken do
  before do
    stub_const("Aocli::Values::CONFIG_FILE_PATH", "spec/tmp/files/.aocli_config")
  end

  describe ".run!" do
    subject(:run_command) { described_class.run!(options) }
    let(:options) { {token: "this is my token"} }

    it "saves the token in the aocli_config file" do
      expect(File).to receive(:write).with("spec/tmp/files/.aocli_config", {token: "this is my token"}.to_yaml).and_call_original

      run_command
    end
  end
end

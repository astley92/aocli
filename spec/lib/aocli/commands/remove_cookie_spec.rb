RSpec.describe Aocli::Commands::RemoveCookie do
  before do
    Aocli::FileUtils.touch_file("spec/tmp/files/.aocli_config")
    stub_const("Aocli::Values::CONFIG_FILE_PATH", "spec/tmp/files/.aocli_config")
  end

  describe ".run!" do
    subject(:run_command) { described_class.run! }

    it "removes the aocli_config file" do
      expect(File).to receive(:delete).with("spec/tmp/files/.aocli_config").and_call_original

      run_command
    end
  end
end

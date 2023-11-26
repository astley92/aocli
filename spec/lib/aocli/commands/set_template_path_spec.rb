RSpec.describe Aocli::Commands::SetTemplatePath do
  before do
    stub_const("Aocli::Values::CONFIG_FILE_PATH", "spec/tmp/files/.aocli_config")
  end

  describe ".run!" do
    subject(:run_command) { described_class.run!(options) }
    let(:options) { {template_path: "./spec/fixtures/custom_template.txt"} }

    it "saves the path in config" do
      expect(Aocli::Config)
        .to receive(:add_config)
        .with(key: :template_path, value: "./spec/fixtures/custom_template.txt")
        .and_call_original

      run_command
    end
  end
end

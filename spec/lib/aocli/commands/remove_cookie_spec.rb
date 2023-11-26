RSpec.describe Aocli::Commands::RemoveCookie do
  before do
    stub_const("Aocli::Values::CONFIG_FILE_PATH", "spec/tmp/files/.aocli_config")
  end

  describe ".run!" do
    subject(:run_command) { described_class.run! }

    before do
      Aocli::Config.add_config(key: :cookie, value: "heyyyyy")
    end

    it "removes the cookie from the config file" do
      expect { run_command }.to change { Aocli::Config.value_for(:cookie) }.from("heyyyyy").to(nil)
    end
  end
end

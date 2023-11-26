RSpec.describe Aocli::Config do
  describe ".value_for" do
    subject(:get_cookie) { described_class.value_for(value_key) }
    let(:value_key) { :cookie }

    context "when the key is present in config" do
      before { stub_const("Aocli::Values::CONFIG_FILE_PATH", "spec/fixtures/.aocli_config") }

      it "returns the value" do
        expect(get_cookie).to eq("My real cookie goes in here")
      end
    end

    context "when the key is not present" do
      let(:value_key) { :noooooope }

      it "returns nil" do
        expect(get_cookie).to eq(nil)
      end
    end
  end

  describe ".add_config" do
    it "adds the the given configuration to the existing config" do
      described_class.add_config(key: :my_special_config, value: "hey there.....")
      described_class.add_config(key: :my_other_special_config, value: "hey there.....")
      described_class.add_config(key: :my_special_config, value: "amended config value")

      config = described_class.load_config

      expect(config).to eq(
        {
          my_special_config: "amended config value",
          my_other_special_config: "hey there.....",
        }
      )
    end
  end

  describe ".remove_config" do
    it "removes the given config value" do
      described_class.add_config(key: :my_special_config, value: "hey there.....")
      described_class.add_config(key: :my_other_special_config, value: "hey there.....")
      described_class.remove_config(:my_special_config)

      config = described_class.load_config

      expect(config).to eq(
        {
          my_other_special_config: "hey there.....",
        }
      )
    end
  end
end

RSpec.describe Aocli::TokenRetriever do
  describe ".call" do
    subject(:get_token) { described_class.call }

    context "when the user does have one configured" do
      before { stub_const("Aocli::Values::CONFIG_FILE_PATH", "spec/fixtures/.aocli_config") }

      it "returns the token" do
        expect(get_token).to eq("My real token goes in here")
      end
    end

    context "when the user does have one configured" do
      before { stub_const("Aocli::Values::CONFIG_FILE_PATH", "spec/fixtures/.i_dont_exist") }

      it "returns nil" do
        expect(get_token).to eq(nil)
      end
    end
  end
end

RSpec.describe Aocli::TokenRetriever do
  describe ".call" do
    subject(:get_token) { described_class.call }

    context "when the user does have one configured" do
      before { stub_const("Aocli::TokenRetriever::TOKEN_LOCATION", "spec/fixtures/.aocli_config") }

      it "returns the token" do
        expect(get_token).to eq("My real token goes in here")
      end
    end
  end
end

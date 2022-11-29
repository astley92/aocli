RSpec.describe Aocli::CookieRetriever do
  describe ".call" do
    subject(:get_cookie) { described_class.call }

    context "when the user does have one configured" do
      before { stub_const("Aocli::Values::CONFIG_FILE_PATH", "spec/fixtures/.aocli_config") }

      it "returns the cookie" do
        expect(get_cookie).to eq("My real cookie goes in here")
      end
    end

    context "when the user does have one configured" do
      before { stub_const("Aocli::Values::CONFIG_FILE_PATH", "spec/fixtures/.i_dont_exist") }

      it "returns nil" do
        expect(get_cookie).to eq(nil)
      end
    end
  end
end

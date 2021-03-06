require_relative "../../app/services/user"

describe User do
  fixtures :all
  context "user has active organization" do
    let(:user) {
      u = User.new
      org = organizations(:o1)
      u.activate_organization(org)
      return u
    }

    it "can return rdf for selected options" do
      option = options(:no_option)
      user.select(option)
      expect(user.rdf).to eq("a b c .")
    end

    it "can deselect options" do
      option = options(:yes_option)
      user.select(option)
      user.deselect(option)
      expect(user.responses.count).to be(0)
    end

    it "can select option with a value" do
      option = options(:text_option)
      allow(option).to receive(:rdf).with("5").and_return("a b 5 .")
      user.select(option, "5")
      expect(user.rdf).to eq("a b 5 .")
    end
  end

  it "can activate organization" do
    u = User.new
    org = double
    u.activate_organization(org)
    expect(u.active_organization).to be(org)
  end

  it "throws error when selecting option with no active organization" do
    u = User.new
    o = double
    expect {
      u.select(o)
    }.to raise_error(NoOrganizationError)
  end
end

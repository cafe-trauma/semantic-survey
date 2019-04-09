require_relative "../app/services/user"

describe User do
  def initialized_user()
    u = User.new
    org = double()
    u.activate_organization(org)
    return u
  end

  it "can return rdf for selected options" do
    u = initialized_user
    option = double()
    allow(option).to receive(:rdf).and_return("a b c .")
    u.select(option)
    expect(u.rdf).to eq("a b c .")
  end

  it "can deselect options" do
    u = initialized_user
    option = double()
    u.select(option)
    u.deselect(option)
    expect(u.responses.count).to be(0)
  end

  it "can activate organization" do
    u = User.new
    org = double()
    u.activate_organization(org)
    expect(u.active_organization).to be(org)
  end

  it "throws error when selecting option with no active organization" do
    u = User.new
    o = double()
    expect{
      u.select(o)
    }.to raise_error(NoOrganizationError)
  end

  it "can select option with a value" do
    u = initialized_user
    option = double()
    allow(option).to receive(:rdf).with(5).and_return("a b 5 .")
    u.select(option, 5)
    expect(u.rdf).to eq("a b 5 .")
  end
end

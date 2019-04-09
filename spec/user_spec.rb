require_relative "../app/services/user"

describe User do
  it "can remember selected options" do
    u = User.new
    org = double()
    u.activate_organization(org)
    option = double()
    u.select(option)
    expect(u.options).to include(option)
  end

  it "can return rdf for selected options" do
    u = User.new
    org = double()
    u.activate_organization(org)
    option = double()
    allow(option).to receive(:rdf).and_return("a b c .")
    u.select(option)
    expect(u.rdf).to eq("a b c .")
  end

  it "can deselect options" do
    u = User.new
    org = double()
    u.activate_organization(org)
    option = double()
    u.select(option)
    u.deselect(option)
    expect(u.options.count).to be(0)
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
end

require_relative "../app/services/user"

describe User do
  it "can remember selected options" do
    u = User.new
    option = double()
    u.select(option)
    expect(u.options).to include(option)
  end

  it "can return rdf for selected options" do
    u = User.new
    option = double()
    allow(option).to receive(:rdf).and_return("a b c .")
    u.select(option)
    expect(u.rdf).to eq("a b c .")
  end
end

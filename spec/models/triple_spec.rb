require "rails_helper"

RSpec.describe Triple, type: :model do
  fixtures :all

  it "can return own rdf representation" do
    t = triples(:no_value)
    expect(t.rdf).to eq("a b c .")
  end

  it "can return rdf with value" do
    t = triples(:yes_value)
    expect(t.rdf(5)).to eq("a b 5 .")
  end
end

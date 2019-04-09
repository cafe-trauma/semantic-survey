require 'rails_helper'

RSpec.describe Triple, type: :model do
  it "can be created with s p o" do
    t = Triple.from_strings("a", "b", "c")
    expect(t.s).to eq("a")
    expect(t.p).to eq("b")
    expect(t.o).to eq("c")
  end

  it "can return own rdf representation" do
    t = Triple.from_strings("a", "b", "c")
    expect(t.rdf).to eq("a b c .")
  end

  it "can return rdf with value" do
    t = Triple.from_strings("a", "b", Triple::Value)
    expect(t.rdf(5)).to eq("a b 5 .")
  end
end

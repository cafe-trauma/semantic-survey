require_relative "../app/services/option"

describe Option do
  it "can be created with triples" do
    triples = Array.new(2) { double() }
    option = Option.new(triples: triples)
    expect(option.triples).to eq(triples)
  end

  it "can return rdf representation" do
    triple = double()
    allow(triple).to receive(:rdf).and_return("a b c .")
    option = Option.new(triples: [triple])
    expect(option.rdf).to eq("a b c .")
  end

  it "can return rdf with values" do
    triple = double()
    allow(triple).to receive(:rdf).with(5).and_return("a b 5 .")
    option = Option.new(triples: [triple])
    expect(option.rdf(5)).to eq("a b 5 .")
  end
end

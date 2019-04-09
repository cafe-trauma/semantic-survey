class Option
  attr_reader :triples

  def initialize(triples:)
    @triples = triples
  end

  def rdf(value=nil)
    @triples.map { |t| t.rdf(value) }.join("\n")
  end
end

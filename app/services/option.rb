class Option
  attr_reader :triples

  def initialize(triples:)
    @triples = triples
  end

  def rdf
    @triples.map { |t| t.rdf }.join("\n")
  end
end

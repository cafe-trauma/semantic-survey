class Triple
  attr_reader :s, :p, :o

  def initialize(s, p, o)
    @s = s
    @p = p
    @o = o
  end

  def rdf
    "#{s} #{p} #{o} ."
  end
end

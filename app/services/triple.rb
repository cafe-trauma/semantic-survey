class Triple
  attr_reader :s, :p, :o

  def initialize(s, p, o)
    @s = s
    @p = p
    @o = o
  end

  def rdf(value=nil)
    s = @s == :input ? value : @s
    p = @p == :input ? value : @p
    o = @o == :input ? value : @o
    "#{s} #{p} #{o} ."
  end
end

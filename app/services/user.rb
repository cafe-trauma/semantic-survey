class User
  attr_reader :options

  def initialize()
    @options = []
  end

  def select(option)
    @options << option
  end

  def rdf
    @options.map { |o| o.rdf }.join("\n")
  end
end

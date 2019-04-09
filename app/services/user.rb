class NoOrganizationError < RuntimeError
end

class User
  attr_reader :options, :active_organization

  def initialize()
    @options = []
  end

  def select(option)
    raise NoOrganizationError if @active_organization.nil?
    @options << option
  end

  def deselect(option)
    @options.delete(option)
  end

  def rdf
    @options.map { |o| o.rdf }.join("\n")
  end

  def activate_organization(org)
    @active_organization = org
  end
end

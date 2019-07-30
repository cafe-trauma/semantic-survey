class NoOrganizationError < RuntimeError
end


class User
  attr_reader :responses, :active_organization

  def initialize()
    @responses = []
  end

  def select(option, value=nil)
    raise NoOrganizationError if @active_organization.nil?
    @responses << Response.create!(:organization => @active_organization,
                                   :option => option,
                                   :text_value => value)
  end

  def deselect(option)
    @responses.delete_if { |response|
      response.option == option
    }
  end

  def rdf
    @responses.map { |o| o.rdf }.join("\n")
  end

  def activate_organization(org)
    @active_organization = org
  end
end

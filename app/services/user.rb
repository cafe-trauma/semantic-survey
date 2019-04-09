class NoOrganizationError < RuntimeError
end


class User
  class Response
    attr_reader :option, :value
    def initialize(option, value=nil)
      @option = option
      @value = value
    end

    def rdf
      option.rdf(value)
    end
  end

  attr_reader :responses, :active_organization

  def initialize()
    @responses = []
  end

  def select(option, value=nil)
    raise NoOrganizationError if @active_organization.nil?
    @responses << Response.new(option, value)
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

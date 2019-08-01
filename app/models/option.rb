class Option < ApplicationRecord
  has_many :triples
  belongs_to :question

  def rdf(value=nil)
    triples.map { |t| t.rdf(value) }.join("\n")
  end

  def response(organization)
    Response.find_by(organization: organization, option: self)
  end

  def selected(organization)
    Response.where(organization: organization, option: self).any?
  end

  def text_response(organization)
    resp = response(organization)
    return resp.text_value unless resp.nil?
  end
end

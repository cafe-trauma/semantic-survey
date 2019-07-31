class Option < ApplicationRecord
  has_many :triples
  belongs_to :question

  def rdf(value=nil)
    triples.map { |t| t.rdf(value) }.join("\n")
  end

  def response(organization)
    Response.find_by(organization: organization, option: self)
  end
end

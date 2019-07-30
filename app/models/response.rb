class Response < ApplicationRecord
  belongs_to :organization
  belongs_to :option
  def rdf
    option.rdf(text_value)
  end
end

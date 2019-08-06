class Triple < ApplicationRecord
  class Value; end

  belongs_to :option

  def rdf(value = nil)
    sv = s.nil? ? value : s
    pv = p.nil? ? value : p
    ov = o.nil? ? value : o
    "#{sv} #{pv} #{ov} ."
  end
end

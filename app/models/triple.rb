class Triple < ApplicationRecord
  class Value; end

  def self.from_strings(s, p, o)
    s = s == Triple::Value ? nil : s
    p = p == Triple::Value ? nil : p
    o = o == Triple::Value ? nil : o
    create!(:s => s, :p => p, :o => o)
  end

  def rdf(value=nil)
    sv = s.nil? ? value : s
    pv = p.nil? ? value : p
    ov = o.nil? ? value : o
    "#{sv} #{pv} #{ov} ."
  end
end

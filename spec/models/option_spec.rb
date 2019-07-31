require 'rails_helper'

RSpec.describe Option, type: :model do
  fixtures :all

  it "can return rdf representation" do
    option = options(:no_option)
    expect(option.rdf).to eq("a b c .")
  end

  it "can return rdf with values" do
    option = options(:yes_option)
    expect(option.rdf(5)).to eq("a b 5 .")
  end

  it "can return response for an organization" do
    option = options(:yes_option)
    org = organizations(:o1)
    expect(option.response(org)).to eq(responses(:o1q1))
  end
end

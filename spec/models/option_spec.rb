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

  it "can know if it should be selected" do
    org = organizations(:o1)
    expect(options(:yes_option).selected(org)).to eq(true)
    expect(options(:no_option).selected(org)).to eq(false)
  end

  it "returns false if no organization" do
    expect(options(:yes_option).selected(nil)).to eq(false)
  end

  it "can return text or blank string on text options" do
    org = organizations(:o1)
    expect(options(:text_option).text_response(org)).to eq("answer")
    expect(options(:text_option).text_response(nil)).to be(nil)
    expect(options(:text_option).text_response(organizations(:o2))).to eq(nil)
  end
end

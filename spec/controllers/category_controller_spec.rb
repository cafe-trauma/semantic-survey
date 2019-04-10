require 'rails_helper'

RSpec.describe CategoryController, type: :controller do
  render_views

  it "renders questions for the given category" do
    Question.create!(:text => "test question", :category => "test-category")
    get :show, params: {:category => "test-category"}
    expect(response.body).to include("test question")
  end

  it "renders correct template for given category" do
    skip
  end

  it "redirects to home for missing templates" do
    skip
  end
end

require 'rails_helper'

RSpec.describe CategoryController, type: :controller do
  render_views

  it "renders questions for the given category" do
    Question.create!(:text => "test question", :category => "test-category")
    get :show, params: {:category => "test-category"}
    expect(response.body).to include("test question")
  end
end

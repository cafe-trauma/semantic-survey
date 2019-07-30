require 'rails_helper'

RSpec.describe QuestionController, type: :controller do
  render_views

  it "renders the question" do
    q = Question.create!(:text => "test question", :category => "test-category")
    get :show, params: {:id => q.id}
    expect(response.body).to include("test question")
  end

  it "allows question answers when organization exists" do
    q = Question.create!(:text => "a question to answer", :category => "test-category")
    o = Organization.create!(:name => "Spec organization")
    post :update, params: {:id => q.id}, session: {:active_organization => o}
    expect(response).to have_http_status(:success)
  end

  it "forbids question answers with no organization" do
    q = Question.create!(:text => "a question to answer", :category => "test-category")
    post :update, params: {:id => q.id}
    expect(response).to have_http_status(:forbidden)
  end
end

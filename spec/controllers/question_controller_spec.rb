require 'rails_helper'

RSpec.describe QuestionController, type: :controller do
  fixtures :all

  it "forbids question answers with no organization" do
    q = Question.create!(:text => "a question to answer", :category => "test-category")
    post :update, params: {:id => q.id}
    expect(response).to have_http_status(:forbidden)
  end

  it "creates response records" do
    q1 = questions(:q1)
    o3 = organizations(:o3)
    yo = options(:yes_option)
    post :update,
         params: {:id => q1.id,
                  :question => {yo.id => true}},
         session: {:active_organization => o3.id}
    expect(yo.response(o3)).to be_an_instance_of(Response)
  end
end

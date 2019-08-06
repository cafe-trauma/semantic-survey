require "rails_helper"

RSpec.describe QuestionController, type: :controller do
  fixtures :all

  it "forbids question answers with no organization" do
    q = Question.create!(text: "a question to answer", category: "test-category")
    post :update, params: {id: q.id}
    expect(response).to have_http_status(:forbidden)
  end

  it "creates response records for radio" do
    q1 = questions(:q1)
    o3 = organizations(:o3)
    yo = options(:yes_option)
    post :update,
      params: {id: q1.id,
               question: {radio: yo.id},},
      session: {active_organization: o3.id}
    expect(yo.response(o3)).to be_an_instance_of(Response)
  end

  it "swaps responses for radio question" do
    q1 = questions(:q1)
    o1 = organizations(:o1)
    yo = options(:yes_option)
    no = options(:no_option)
    post :update,
      params: {id: q1.id,
               question: {radio: no.id},},
      session: {active_organization: o1.id}
    expect(no.response(o1)).to be_an_instance_of(Response)
    expect(yo.response(o1)).to be(nil)
  end
end

require "rails_helper"

RSpec.describe WelcomeController, type: :controller do
  fixtures :all

  it "renders the welcome page" do
    get :index
    expect(response).to render_template(:index)
  end

  it "registers new users" do
    post :register, params: {:new_user => {:email => "new@example.com"}}
    expect(Organization.exists?(email: "new@example.com")).to be(true)
    expect(session).to have_key(:active_organization)
  end

  it "does not register duplicate users" do
    post :register, params: {:new_user => {:email => "existing@example.com"}}
    expect(Organization.where(email: "existing@example.com").count).to eq(1)
  end
end

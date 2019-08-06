require "rails_helper"

RSpec.describe CategoryController, type: :controller do
  fixtures :questions

  it "renders correct template for given category" do
    get :show, params: {category: "test-category"}
    expect(response).to render_template("category/test-category")
  end

  it "redirects to home for missing templates" do
    get :show, params: {category: "missing-category"}
    expect(response).to redirect_to "/"
  end
end

require "rails_helper"

describe "landing page" do
  it "should render" do
    # login_user
    visit_and_confirm "/"
    expect(page.body).to include("Myapp Landing Page")
  end
end

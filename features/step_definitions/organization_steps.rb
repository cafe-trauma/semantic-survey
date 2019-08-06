Given("A User") do
  @user = User.new
end

Given("An Organization") do
  @organization = Organization.create!(email: "cucumber2@example.com")
end

When("User selects organization") do
  @user.activate_organization(@organization)
end

Then("User should have organization") do
  expect(@user.active_organization).to be(@organization)
end

Then("We should not be able to select o1") do
  expect {
    @user.select(@options["o1"])
  }.to raise_error(NoOrganizationError)
end

When("user first loads homepage") do
  visit "/"
  @content = page.source
end

When("clicks {string} button") do |text|
  click_button(text)
end

When("types {string} into {string}") do |text, field|
  fill_in field, with: text
end

Then("should be prompted for an email") do
  expect(page).to have_field("Email")
end

Then("asked which questionnaire to begin") do
  expect(page).to have_link("Trauma Center")
  expect(page).to have_link("Trauma System")
end

Then("told email is already registered") do
  expect(page).to have_button("Send Email")
end

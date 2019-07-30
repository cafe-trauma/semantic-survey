When("The user navigates to the correct category") do
  visit "questionnaire/test-category"
  @content = page.source
end

Then("The user sees the question text") do
  expect(@content).to include("test question?")
end

When("The user inputs text") do
  within(:css, "#q2") do
    fill_in('Response', :with => 'my unique answer')
  end
end

When("The user submits") do
  within(:css, "#q2") do
    click('Submit')
  end
end

Then("The user sees multiple questions") do
  expect(@content).to have_selector('.question', count: 2)
end

Then("The user should still see their answer") do
  expect(@content).to include("my unique answer")
end

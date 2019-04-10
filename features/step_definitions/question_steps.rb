When("The user navigates to the correct category") do
  visit "questionnaire/test-category"
  @content = page.source
end

Then("The user sees the question text") do
  expect(@content).to include("question text")
end

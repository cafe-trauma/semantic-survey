When("The user navigates to the correct category") do
  visit "/questionnaire/test-category"
  @content = page.source
end

When("The user inputs text") do
  within(:css, "#q2") do
    find('input[type="text"]').set('my unique answer')
  end
end

When("The user submits q{int}") do |int|
  within(:css, "#q#{int}") do
    click_on('Update Question')
  end
end

When("The user picks first button") do
  within(:css, "#q5") do
    first(:xpath, './/input[@type="radio"]').click
  end
end

When("The user picks {string}") do |string|
  select(string)
end

Then("The user sees multiple questions") do
  expect(@content).to have_selector('.question', minimum: 2)
end

Then("The user should still see their answer") do
  expect(@content).to include("my unique answer")
end

Then("{string} should be selected") do |string|
  expect(@content).to have_select('question_select', selected: string)
end

Then("the first button should be checked") do
  within(:css, "#q5") do
    expect(first(:xpath, './/input[@type="radio"]')).to be_checked()
  end
end

Then("{string} should be checked") do |string|
  expect(@content).to have_checked_field(string)
end

Then("The user sees the question text") do
  expect(@content).to include("test question?")
end

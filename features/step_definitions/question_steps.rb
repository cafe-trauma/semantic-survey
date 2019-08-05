When("The user navigates to the correct category") do
  puts(Question.all.inspect)
  visit "/questionnaire/test-category"
  @content = page.source
end

When("The user inputs text") do
  within(:css, "#q2") do
    find('input[type="text"]').set('my unique answer')
  end
end

When("The user submits") do
  within(:css, "#q2") do
    click_on('Update Question')
  end
end

When("The user picks yes") do
  q1 = Question.find_by(short_name: "q1")
  puts(q1.options.inspect)
  within(:css, "#q1") do
    choose('Yes')
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

Then("yes should be selected") do
  expect(@content).to have_checked_field('Yes')
end

Then("{string} should be selected") do |string|
  expect(@content).to have_selected(string)
end

Then("The user sees the question text") do
  expect(@content).to include("test question?")
end

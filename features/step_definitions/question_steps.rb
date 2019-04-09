Given("A User with an organization") do
  @user = User.new
  @user.activate_organization(Organization.new)
end

When("We have defined triples for o1") do
  @options ||= {}
  q = Question.create!
  o = Option.create!(:question => q)
  t = Triple.create!(:s => "a", :p => "b", :o => "c", :option => o)
  @options["o1"] = o
end

When("We have defined triples for o2") do
  @options ||= {}
  q = Question.create!
  o = Option.create!(:question => q)
  t = Triple.create!(:s => "c", :p => "d", :o => "e", :option => o)
  @options["o2"] = o
end

When("We have defined a triple with input") do
  @options ||= {}
  q = Question.create!
  o = Option.create!(:question => q)
  t = Triple.create!(:s => "a", :p => "b", :o => nil, :option => o)
  @options["input"] = o
end

When("User has selected {word}") do |name|
  @user.select(@options[name])
end

When("User has selected {word} with {int}") do |name, int|
  @user.select(@options[name], int)
end

When("User has deselected {word}") do |name|
  @user.deselect(@options[name])
end

Then("We can generate RDF triples for o1") do
  expect(@user.rdf).to eq("a b c .")
end

Then("We should generate RDF for o1 and o2") do
  expect(@user.rdf).to eq("a b c .\nc d e .")
end

Then("We can generate RDF with correct value of {int}") do |int|
  expect(@user.rdf).to eq("a b #{int} .")
end

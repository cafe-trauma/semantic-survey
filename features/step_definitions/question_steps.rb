Given("A User with an organization") do
  @user = User.new
  @user.activate_organization(Organization.new)
end

When("We have defined triples for o1") do
  @options ||= {}
  t1 = Triple.new("a", "b", "c")
  @options["o1"] = Option.new(triples: [t1])
end

When("We have defined triples for o2") do
  @options ||= {}
  t2 = Triple.new("c", "d", "e")
  @options["o2"] = Option.new(triples: [t2])
end

When("We have defined a triple with input") do
  @options ||= {}
  t_option = Triple.new("a", "b", :input)
  @options["input"] = Option.new(triples: [t_option])
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

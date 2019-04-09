Given("A User") do
  @user = User.new
end

Given("An Organization") do
  @organization = Organization.new
end

Given("A User with an organization") do
  @user = User.new
  @user.activate_organization(Organization.new)
end

When("We have defined triples for o1") do
  @options ||= {}
  @t1 = Triple.new("a", "b", "c")
  @options["o1"] = Option.new(triples: [@t1])
end

When("We have defined triples for o2") do
  @options ||= {}
  @t2 = Triple.new("c", "d", "e")
  @options["o2"] = Option.new(triples: [@t2])
end

When("User has selected o{int}") do |int|
  @user.select(@options["o#{int}"])
end

When("User has deselected o{int}") do |int|
  @user.deselect(@options["o#{int}"])
end

When("User selects organization") do
  @user.activate_organization(@organization)
end

Then("We can generate RDF triples for o1") do
  expect(@user.rdf).to eq("a b c .")
end

Then("We should generate RDF for o1 and o2") do
  expect(@user.rdf).to eq("a b c .\nc d e .")
end

Then("User should have organization") do
  expect(@user.active_organization).to be(@organization)
end

Then("We should not be able to select o1") do
  expect {
    @user.select(@options["o1"])
  }.to raise_error(NoOrganizationError)
end

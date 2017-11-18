Given /the following accounts exist/ do |users_table|
  users_table.hashes.each do |user_hash|
    user = User.create user_hash
    user.amenity_list = AmenityList.create(couch: true, tv: true, wifi: true)
    path = Rails.root.join('app', 'assets', 'images', 'user_images', user_hash[:email])
    Dir.mkdir path unless File.exists? path
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

Then /account with email "(.*)" should( not)? exist/ do |e, should_not_exist|
  user = User.find_by(email: e)
  if should_not_exist
      expect(user == nil)
  else
      expect(user.email == e)
  end
end

Given /account with email "(.*)" is( not)? searchable/ do |e, not_searchable|
  user = User.find_by(email: e)
  if not_searchable
    user.update_attribute(:searchable, nil)
  else
    user.update_attribute(:searchable, true)
  end
end

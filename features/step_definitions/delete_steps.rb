Then /I do not see "([^"]*)"$/ do |text|
  expect(page.has_no_content?(text) == false)
end

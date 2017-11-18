And /I click the first "(.*)"/ do |l|
    first(:link, l).click
end

Then /^I should see a map/ do
    expect(page.body.include?("<div id='map'")).to be true
end

And /I log in with email "(.*)" and password "(.*)"/ do |e, p|
    steps %Q{
        Given I am on the login page
        And I fill in "Email" with "#{e}"
        And I fill in "Password" with "#{p}"
        Then I press "Log In"
    }
end

Then /I should be logged in as user with email "(.*)"/ do |e|
    user = User.find_by(email: e ) 
    expect(user.email == session[:email])
end

Then /I should not be logged in/ do
    steps %Q{
        Given I am on the home page
        Then I should see "Login"
    }
end

Then /I should see an error message/ do
    step %{I should see "Invalid email/password combination"}
end

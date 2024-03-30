require 'capybara'

session = Capybara::Session.new(:selenium)
session.visit "http://hack-yourself-first.com"

# Close the disclaimer pop-up
session.find_button("Close").click

# Login
## Click on the link
session.click_link("Log in")
## Fill in the form
session.fill_in("Email", with: "pungrumpy@example.org")
session.fill_in("Password", with: "*********")
session.check("RememberMe")
## Submit the form
session.click_button("Log in")

# Go to the profile page
session.click_link("My account")
session.click_link("Edit profile")

# Display retrieved data
puts "First name: #{session.find_field("FirstName").value}"
puts "Last name: #{session.find_field("LastName").value}"

# Close the browser
sleep 5
session.driver.quit

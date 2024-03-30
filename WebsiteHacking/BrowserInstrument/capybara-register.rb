require "capybara"

session = Capybara::Session.new(:selenium)
session.visit "http://hack-yourself-first.com"

# Close the disclaimer pop-up
session.find_button("Close").click

# Register a new user
## Click on the link
session.click_link("Register")
## Fill in the form
session.fill_in("Email", with: "pungrumpy@example.org")
session.fill_in("FirstName", with: "Pun")
session.fill_in("LastName", with: "Grumpy")
session.fill_in("Password", with: "**********")
session.fill_in("ConfirmPassword", with: "**********")
## Submit the form
session.click_button("Register")

# Close the browser
sleep 5
session.driver.quit

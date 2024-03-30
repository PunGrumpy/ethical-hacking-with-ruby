require "watir"
require "webdrivers"

b = Watir::Browser.new :firefox

b.goto "http://hack-yourself-first.com"

# Close the disclaimer pop-up
## Wait for the initial pop-up to appear
b.button(visible_text: 'Close').wait_until(&:visible?).click

# Login
## Click on the link
## Wait util pop-up is closed
b.link(visible_text: 'Log in').wait_while(&:obscured?).click
# Fill in the form
b.text_field(id: 'Email').set('pungrumpy@pwn.by')
b.text_field(id: 'Password').set('*********')
b.checkbox(id: 'RememberMe').check
## Wait util pop-up is closed
# b.link(visible_text: 'Log in').wait_while(&:obscured?).click
## Submit the form
b.button(text: 'Log in').click

# Go to the profile page
b.link(visible_text: 'My account').click
b.link(visible_text: 'Edit profile').click
# Display retrieved data
puts "First name: #{b.text_field(id: 'FirstName').value}"
puts "Last name: #{b.text_field(id: 'LastName').value}"

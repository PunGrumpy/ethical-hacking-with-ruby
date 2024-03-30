require "watir"
require "webdrivers"

b = Watir::Browser.new :firefox

b.goto "http://hack-yourself-first.com"

# Close the disclaimer pop-up
## Wait for the initial pop-up to appear
b.button(visible_text: 'Close').wait_until(&:visible?).click

# Register a new user
## Click on the link
## Wait util pop-up is closed
b.link(text: 'Register').wait_while(&:obscured?).click
# Fill in the form
b.text_field(id: 'Email').set('pungrumpy@pwn.by')
b.text_field(id: 'FirstName').set('Pun')
b.text_field(id: 'LastName').set('Grumpy')
b.text_field(id: 'Password').set('*********')
b.text_field(id: 'ConfirmPassword').set('*********')
## Submit the form
b.button(text: 'Register').click

# Close the browser
sleep 5
b.close

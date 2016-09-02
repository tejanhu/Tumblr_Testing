require 'spec_helper.rb'
require 'pry'

describe "Navigate to the tumblr website" do
  it "should navigate to the tumblr website and login" do
    browser = Watir::Browser.new :chrome
    browser.goto "http://tumblr.com/login"

    browser.driver.manage.timeouts.implicit_wait = 10


    #testing Logging in using valid credentials

    # waits for the email text field and then enters the email into the text field
    browser.text_field(:id => "signup_determine_email").when_present.set "tejanahmedhu@gmail.com"
    # waits for the next button and then clicks the next button
    browser.button(:class, "big signup_forms_submit touchy blue").when_present.click
    # waits for the password field to be present and then enters the password
    browser.text_field(:id => "signup_password").when_present.set "123456pass"
    # waits for the login button and clicks the log in button
    browser.button(id: "signup_forms_submit").when_present.click
   	# waits to click the log out button
    browser.div(:class => "tab iconic tab_nav_account").when_present.click
    browser.div(:class => "popover_item_suffix").when_present.click
    browser.button(:class => "ui_button btn_1 chrome blue").when_present.click

    #testing email with no tumblr account error

    # waits for the email text field and then enters the email into the text field
    browser.text_field(:id => "signup_determine_email").when_present.set "husseinbarkingabbey@hotmail.com"
    # waits for the next button and then clicks the next button
    browser.button(:class, "big signup_forms_submit touchy blue").when_present.click
    #verifies what error was shown
    browser.ul(:class => "signup_forms_errors").when_present.li(:class => "error").when_present.text == "This email doesn't have a Tumblr account. "
    #quits the browser
    # browser.quit

    
    #testing invalid email syntax error

    # waits for the email text field and then enters the email into the text field
    browser.text_field(:id => "signup_determine_email").when_present.set "tejanahmedhu"
    # waits for the next button and then clicks the next button
    browser.button(:class, "big signup_forms_submit touchy blue").when_present.click
    #verifies what error was shown
    browser.ul(:class => "signup_forms_errors").when_present.li(:class => "error").when_present.text == "This email doesn't have a Tumblr account. "
    #quits the browser
    # browser.quit

    #testing wrong password error

    # waits for the email text field and then enters the email into the text field
    browser.text_field(:id => "signup_determine_email").when_present.set "tejanahmedhu@gmail.com"
    # waits for the next button and then clicks the next button
    browser.button(:class, "big signup_forms_submit touchy blue").when_present.click
     # waits for the password field to be present and then enters the password
    browser.text_field(:id => "signup_password").when_present.set "123456"
     # waits for the login button and clicks the log in button
    browser.button(id: "signup_forms_submit").when_present.click
    #verifies what error was shown
    browser.ul(:class => "signup_forms_errors").when_present.li(:class => "error").when_present.text == "Your email or password were incorrect."


    # # waits for the email text field and then enters the email into the text field
    # browser.text_field(:id => "signup_determine_email").when_present.set "tejanahmedhu@gmail.com"
    # # waits for the next button and then clicks the next button
    # browser.button(:class, "big signup_forms_submit touchy blue").when_present.click
    # # waits for the password field to be present and then enters the password
    # browser.text_field(:id => "signup_password").when_present.set "123456pass"
    # # waits for the login button and clicks the log in button
    # browser.button(id: "signup_forms_submit").when_present.click
    # # waits for compose button and then clicks the compose button
    # browser.button(:class, "compose-button").when_present.click
    # # waits for the text button and then clicks the text button
    # browser.div(:class, "post-type-icon").when_present.click
    # # types "Romeo!" in the title
    # browser.div(:class, "editor editor-plaintext").when_present.send_keys "Romeo!"
    # #types "Hello there!" in the body
    # browser.div(:class, "editor editor-richtext").send_keys("Hello there!")
    # # #clicks the post button, posting the message
    # browser.button(:class, "button-area create_post_button").click
    # #pauses the program for 3 seconds
    # sleep 3
    # #waits for 10 seconds and then accesses the first post once it is present to verify if the title is equal to "Romeo"
    # Watir::Wait.until(10) {browser.li(:class => /post_container$/).when_present.div(:class => "post_title").when_present.text == "Romeo!"}
    #quits the browser
    browser.quit


  end


end

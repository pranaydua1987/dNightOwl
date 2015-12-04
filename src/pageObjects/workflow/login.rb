#! /usr/bin/env ruby

class Login
  def self.initialize
    $method = __method__
    path_here = File.expand_path("..", Dir.pwd)
    #puts "path from pls #{path_here}"
    @driver_path="#{path_here}/src/binary/phantomjs"
    # Selenium::WebDriver::Chrome.driver_path = driver_path
    Selenium::WebDriver::PhantomJS.path = driver_path
  end

  def self.initialize_browser(browser, url)
    $method = __method__
    $browser = Watir::Browser.new :"#{browser}"
    $browser.driver.manage.window.maximize
    $browser.goto url
    $browser.text_field(:id => "username").wait_until_present
    puts $browser.a(:class,"hide-button").present?
    if ($browser.a(:class,"hide-button").present?.to_s =="true".to_s)
      puts "close toolbar"
      $browser.a(:title,"Close Toolbar").click
      sleep 1
    end
  end

  def self.login_workflow(username, password)
    $method = __method__
    $browser.text_field(:id => "username").set username
    $browser.text_field(:id => "password").set password
    $browser.button(:text => "Sign In").click
    $browser.h2(:text => "Dashboard").wait_until_present(20)
  end

  def self.logout
    $method = __method__
    $browser.a(:href => "/logout").click
    $browser.button(:text => "Sign In").wait_until_present(20)
  end
end

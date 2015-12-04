#! /usr/bin/env ruby

class Before
  def self.initialize
    $method = __method__
    path_here = File.expand_path("..", Dir.pwd)
   # puts "path from pls #{path_here}"
    @driver_path="#{path_here}/src/binary/phantomjs"
    # Selenium::WebDriver::Chrome.driver_path = driver_path
    Selenium::WebDriver::PhantomJS.path = driver_path
  end

  def self.initialize_browser(browser, url)
    $method = __method__

#      download_directory = "#{Dir.pwd}/downloads"
# download_directory.gsub!("/", "\\") if Selenium::WebDriver::Platform.windows?
#
# profile = Selenium::WebDriver::Firefox::Profile.new
# profile['browser.download.folderList'] = 2 # custom location
# profile['browser.download.dir'] = download_directory
# profile['browser.helperApps.neverAsk.saveToDisk'] = "text/csv,application/pdf"
#
# b = Watir::Browser.new :firefox, :profile => profile

    $browser = Watir::Browser.new :"#{browser}"
    $browser.goto url
    $browser.a(:text => "Sign In").wait_until_present
  end

  def self.login_hautelook(username, password)
    $method = __method__
    $browser.a(:text => "Sign In").when_present.click
    $browser.text_field(:id => "login_email").wait_until_present(20)
    $browser.text_field(:id => "login_email").set username
    $browser.text_field(:id => "login_password").set password
    $browser.p(:text => "Sign In").click
    $browser.span(:class => "secondary-nav__link secondary-nav__link--hautelook").wait_until_present(20)
  end

  def self.get_jobid
    var = $browser.url
    var_id = var.split("/").last
    $job_id = var_id

  end
  #  def self.register_hautelook(email,password)
  #    $method = __method__
  #    $browser.text_field(:id => "firstname").set $config["firstname"]
  #    $browser.text_field(:id => "lastname").set $config["lastname"]
  #    $browser.text_field(:id => "email").set email
  #    $browser.text_field(:id => "signup_password").set password
  #    $browser.radio(:id => "#{$config["gender"]}").click
  #    $browser.text_field(:id => "zip_code").set $config["zipcode"]
  #    $browser.select_list(:id => "country").select $config["country"]
  #    $browser.div(:id => "register_btn").click
  #  end
end

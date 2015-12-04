class Dashboard
  def self.links_check
    $method = __method__
    $browser.a(:text => "Search").wait_until_present(15)
    $browser.a(:text => "Brand").wait_until_present(15)
    $browser.a(:text => "Styles").wait_until_present(15)
    $browser.a(:text => "Reports").wait_until_present(15)
    $browser.a(:text => "Dashboard").wait_until_present(15)
    $browser.a(:text => "Workflow").wait_until_present(15)
    # $browser.a(:href =>"/styles").exist?
    # $browser.a(:href =>"/brand").exist?
    # $browser.a(:href =>"/jobs/st1yles").exist?
    # $browser.a(:href =>"/reports").exist?
    # browser.h1(:xpath, "//a[contains(text(),\"Dashboard\")]").exist?
  end

  def self.styles
    $method = __method__
    return $browser.a(:text => "Styles")

  end
  def self.shops
    $method = __method__
    return $browser.a(:text => "Shops")

  end

  def self.table
    return $browser.element(:xpath => "//table")
  end

  def self.icons_check
    $method = __method__
    $browser.i(:class => "fa fa-search").wait_until_present(15) #Search icon
    $browser.i(:class => "fa fa-certificate").wait_until_present(15) #Brand icon
    $browser.i(:class => "fa fa-tag").wait_until_present(15) #Styles icon
    $browser.i(:class => "fa fa-bar-chart-o").wait_until_present(15) # REports Icon
    $browser.i(:class => "fa fa-tachometer").wait_until_present(15) # Dashboard Icon
    # $browser.a(:href =>"/styles").exist?
    # $browser.a(:href =>"/brand").exist?
    # $browser.a(:href =>"/jobs/st1yles").exist?
    # $browser.a(:href =>"/reports").exist?
    # browser.h1(:xpath, "//a[contains(text(),\"Dashboard\")]").exist?
  end

  def self.logout
    $method = __method__
    $browser.a(:href => "/logout").click
    $browser.button(:text => "Sign In").wait_until_present(20)
  end
end

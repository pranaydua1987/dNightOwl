class After
  def self.tear_down
    $browser.quit
  end
end

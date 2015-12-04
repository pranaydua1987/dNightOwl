require 'enumerator'
class PopupModel

  def self.popup_table(table_id)
    $method = __method__
    return $browser.table(:id => "#{table_id}")
  end

  def self.close_button
    $method = __method__
    text="x"
    #puts $browser.button(:text,"x").present?
    puts $browser.element(:xpath => "//div[@id='viewStyleSkusModal']/div[@class='modal-dialog modal-lg']/div[@class='modal-content']/div[@class='modal-header']/button[@class='close']").present?
    return $browser.element(:xpath => "//div[@id='viewStyleSkusModal']/div[@class='modal-dialog modal-lg']/div[@class='modal-content']/div[@class='modal-header']/button[@class='close']")
  #return $browser.button(:text,"x")
  end

  def self.sort_header(header_name, sorting_type)
    $method = __method__
    #puts "//th[contains(text(),\"#{header_name}\") and @class='#{sorting_type}']"
    #puts "//th[contains(text(),\"#{header_name}\") and @class='#{sorting_type}']".visible?
    return $browser.element(:xpath => "//th[contains(text(),\"#{header_name}\") and @class='#{sorting_type}']")
  end

  def self.table_columns(table_id, coloumn_name)
    $method = __method__

    table= PopupModel.popup_table(table_id)
    # Grid.gridroot
    # rows=Grid.getRows_all
    # puts rows.size
    coloumns=table.strings.transpose
    #  puts coloumns.size
    for i in 0..coloumns.size
      if (coloumns[i][0]==coloumn_name)
        #puts "yes"

        return coloumns[i]
      end
    end

  end

  def self.ascending? (coloumn)
    coloumn.each_cons(2).all? { |i, j| i <= j }
  end

  def self.descending? (coloumn)
    coloumn.each_cons(2).all? { |i, j| i >= j }
  end
end

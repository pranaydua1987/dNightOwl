class Shops
  def self.shopButton
    $method = __method__
    return $browser.a(:text,"Shop")
  end
  def self.createNewShopButton
    $method = __method__
    return $browser.a(:text,"Create New Shop")
  end
  def self.shopsTable
    $method = __method__
   # puts "inside shopsTable"
   # puts $browser.table(:class => "table table-striped table-hover search-results-table").visible?
    return $browser.table(:class => "table table-striped table-hover search-results-table")
  end
  def self.shopsColoumn(coloumn_name)
    $method = __method__

    table= Shops.shopsTable
    # Grid.gridroot
    # rows=Grid.getRows_all
    # puts rows.size
    #coloumns=table.strings.transpose
    #puts coloumns
    coloumnData=Array.new
    coloumnCount=table.row.cells.length
    #puts coloumnCount
    #puts table.rows.length
    for i in 0..coloumnCount
      if (table[0][i].text==coloumn_name)
       # puts i
        for j in 1..table.rows.length-2
          #puts table[j][i].text
          cell_data=table[j][i].text
          coloumnData.push(cell_data.to_i)
        end
        #puts coloumnData
        return coloumnData
      end

      i=i+1
        end
    end
  end

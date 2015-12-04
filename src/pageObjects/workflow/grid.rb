class Grid
  def self.gridroot
    $gridroot = $browser.element(:xpath => "//table")
    #puts $gridroot.visible?
  end

  def self.header
    return $gridroot.element(:tag_name => "thead")
  end

  def self.body
    return $gridroot.element(:tag_name => "tbody")
  end

  def self.getColumnHeaders
    return Grid.header.elements(:tag_name => "th")
  end


  def self.getColumnHeader(index)
    coloumnheader= Grid.getColumnHeadersindex
    return coloumnheader[index]
  end

  def self.getColumnHeaderNames
    columnHeaderNames=[]
    columnHeaders=Grid.getColumnHeaders
    for columnHeader in columnHeaders
      columnHeaderNames.push(columnHeader.text)

    end
    #puts columnHeaderNames
    return columnHeaderNames
  end

  def self.getColumnHeaderName(index)
    coloumnHeaderNames=Grid.getColumnHeaderNames
    return coloumnHeaderNames[index]
  end

  def self.getRows_all
    return Grid.body.elements(:tag_name => "tr")
  end

  def self.getRows(type)
    xpath="//tr[contains(@class, '#{type}')]"
   # puts xpath
    body=Grid.body
   # puts body.visible?
   # puts body.elements(:xpath => xpath).size
    # rows=Array.new
    return body.elements(:xpath => xpath)
    # puts rows.size
    # return rows
  end

  def self.getRow_i(index)
   # puts "getRow_i"
   # puts index
    rows=[]
    rows=Grid.getRows_all
   # puts rows
    #puts rows[index]
    return rows[index]
  end

  def self.getCell_int(rowIndex, columnIndex)
    row = Grid.getRow_i(rowIndex.to_i)
    #puts "getCell_int"
    data = row.elements(:tag_name => "td")
    #puts data[columnIndex]
    return data[columnIndex]
  end

  def self.getCell_web_int(row, columnIndex)
    #row=Grid.getRow
    data =row.elements(:tag_name => "td")
   # puts data[columnIndex]
    return data[columnIndex]
  end

  def self.getCell_int_string(rowIndex, columnHeader)

    columnHeaders =Grid.getColumnHeaderNames
    if (!columnHeaders.include?(columnHeader))
      message = "Specified column header doesn't exist!"
     # puts message
    end

    columnIndex = columnHeaders.index(columnHeader)
    #puts columnIndex.to_i
    return Grid.getCell_int(rowIndex, columnIndex.to_i)
  end

  def self.getCell_web_string(row, columnHeader)
    columnHeaders = Grid.getColumnHeaderNames
    if (!columnHeaders.include?(columnHeader))
      message = "Specified column header doesn't exist!"
      #puts message
      #throw new IllegalArgumentException(message);
    end
    columnIndex = columnHeaders.index(columnHeader)
    return Grid.getCell_web_int(row, columnIndex)
  end

  def self.getCellData_int(rowIndex, columnIndex)
    row = Grid.getRow(rowIndex)
    data = row.elements(:tag_name => "td")
    data1=data[columnIndex].elements(:xpath => ".//*")

    if (data1.size>0)
      cell =data1[0]
      tagName=cell.tag_name
      if (tagName=="input")
        return cell.attribute_value("value")
      elsif (tagName=="button")
        return "this is a button"
      elsif (tagName=="select")
        return cell.selected_options.map(&:text)
      else
        #puts tagName
        return tagName
      end
    else
     # puts "notagName"
      return row.elements(:tag_name => "td")[columnIndex].text
    end
  end


  def self.getCellData_int_string(rowIndex, columnHeader)
    columnHeaders = Grid.getColumnHeaderNames
    if (!columnHeaders.include?(columnHeader))
      message = "Specified column header doesn't exist!"
     # puts message

    end
    columnIndex = columnHeaders.index(columnHeader)
    return Grid.getCellData(rowIndex, columnIndex)
  end

  def self.getTable

    column=Grid.getColumnHeaderNames.size
    row=Grid.getRows.size
    #WebElement[][] table=new WebElement[row][column];
    #puts "number of rows: "+column+" and number of rows:"+row
    while (row>0) do
      i=column
      while (i>0) do

        table[row-1][i-1]=Grid.getCell_int(row-1, i-1)
      end

      row=row-1
    end
    return table
  end

end

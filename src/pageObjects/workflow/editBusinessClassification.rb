class Edit_business_class

  def self.validate_button
    return $browser.button(:text => "Validate")
  end

  def self.get_Business_classification
    #this.isAjaxCompleted();
    #Grid.gridroot(Dashboard.table)
    Grid.gridroot
    #Grid grid=new Grid(header.table);
    #List<Map<String, String>> list = new ArrayList<Map<String, String>>();
    #HashMap<String, String> hs1;
    # rows=Array.new
    #puts "1"
    rows=[]
    rows=Grid.getRows("success")
    row=rows.size
    #puts rows.size
    #row=Grid.getRows("success").size
    # puts "2"
    # puts rows
    # row =rows.size
    #  puts "number of rows"+row
    # puts "number of successfuul rows #{row}"
    list=Array.new
    # hs1=Hash.new

    while (row>0) do
      hs1=Hash.new
      hs1["Size"]=Grid.getCell_web_string(rows[row-1], "Size").element(:tag_name => "input").value
      hs1["Color"]=Grid.getCell_web_string(rows[row-1], "Color").element(:tag_name => "input").value
      hs1["Division ID"]=Grid.getCell_web_string(rows[row-1], "Division ID").element(:tag_name => "input").value
      hs1["Department ID"]=Grid.getCell_web_string(rows[row-1], "Department ID").element(:tag_name => "input").value
      hs1["Class ID"]=Grid.getCell_web_string(rows[row-1], "Class ID").element(:tag_name => "input").value
      hs1["Subclass ID"]=Grid.getCell_web_string(rows[row-1], "Subclass ID").element(:tag_name => "input").value
      # hs1["Price"]=Grid.getCell_web_string(rows[row-1], "Price").element(:tag_name =>"input").value
      # #hs1.put["Color Family"]=new Select(grid.getCell(rows.get(row-1), "Color Family").findElement(By.tagName("select"))).getFirstSelectedOption().getText());
      list.push(hs1)
      row=row-1
    end
    #puts list
    return list
  end
end

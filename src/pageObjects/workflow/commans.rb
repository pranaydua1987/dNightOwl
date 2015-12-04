class Comman
  def self.verifyStyleColorsOnStylesGrid(expectedRed, expectedGreen, expectedYellow, expectedBlue)
    $method = __method__
    Stylesgridpageobject.getCountOfColoredRows
    if (expectedRed>0) then
      assert_equal(Stylesgridpageobject.getStyleGridElements(Stylesgridpageobject.redRowsOnStylesGrid).size, expectedRed)

    elsif (expectedGreen>0) then
      assert_equal(stylesGrid.getStyleGridElements(stylesGrid.greenRowsOnStylesGrid).size, expectedGreen)

    elsif (expectedYellow>0) then
      assert_equal(stylesGrid.getStyleGridElements(stylesGrid.yellowRowsOnStylesGrid).size, expectedYellow)

    elsif (expectedYellow>0) then
      assert_equal(stylesGrid.getStyleGridElements(stylesGrid.blueRowsOnStylesGrid).size, expectedBlue)
    end
  end
def self.navigate(url)
  $browser.goto url
end
  def self.verifySkuCountAndStatusOfStyle(styleRow, expectedStatus, expectedNewSkuCount, expectedExistingSkuCount)
    $method = __method__
    #puts "hello pranay"
    status=Stylesgridpageobject.statusOfStyle(styleRow)
    #puts status
    newSkuCount=Stylesgridpageobject.newSkuCountOfStyle(styleRow);
    #puts newSkuCount
    existingSkuCount=Stylesgridpageobject.existingSkuCountOfStyle(styleRow)
    #puts existingSkuCount

    assert_equal(status, expectedStatus)
    assert_equal(newSkuCount, expectedNewSkuCount)
    assert_equal(existingSkuCount, expectedExistingSkuCount)
  end
def self.sendKeys(key)
  $browser.send_keys :key
end
  def self.query_results(query)

    #mysql_client("10.224.5.188","hautelook","hautelook","hautelook")
    qq=$mysqlClient.query(query)

#     mysql_client("10.224.5.188","hautelook","hautelook","hautelook")
# qq=$mysql_client .query(query)

    return qq
  end
  def self.scrollToElement(element)

    #mysql_client("10.224.5.188","hautelook","hautelook","hautelook")
    $browser.execute_script('arguments[0].scrollIntoView();', element)
  end

  def self.verifyStyleRows(styleInfo)
    # //System.out.println("reached verifyStyleRows");
    # //System.out.println(styleInfo);
    dbValidation=false
    #puts "stylestatus:#{styleInfo["status"]}"
    rs=$mysqlClient.query("select * from styles s inner join brands b using(brand_id) where s.style_num ='#{styleInfo["styleNumber"]}' and brand ='#{styleInfo["brand"]}'")
    rs.each do |print_rows|
     # puts print_rows["status"]
      #puts print_rows["name"]
      # log.info("--Check Style Info for style_id:"+rs.getString("style_id")+ " style_num "+styleInfo.get("styleNumber") +" and brand:"+ styleInfo.get("brand")+" and style_group_id:"+ styleInfo.get("groupNumber"));
      # log.info("--Style Info given in spreadsheet: "+styleInfo);
      assert_equal("#{print_rows["status"]}", "#{styleInfo["status"]}", "style status is not as expected. ")
      assert_equal(print_rows["styleName"], styleInfo["name"])
      assert_equal(styleInfo["country"], print_rows["country_iso"], "country_iso is not as expected. ")
      if (styleInfo["weight"]=="0")
        assert_equal("1.00", print_rows["weight"], "weight is not as expected.")
      end
      #else
      #	Assert.assertEquals(moneyFormat.format(Double.parseDouble(styleInfo.get("weight"))), rs.getString("weight"),"weight is not as expected. ");
      assert_equal(print_rows["style_group_id"], styleInfo["groupNumber"], "Nord group number is not as expected. ")
      if (styleInfo["season"].nil? || styleInfo["season"].empty?)
        assert_equal("null", print_rows["season"], "Season is not as expected. ")

      elsif (styleInfo["season"]=="Spring / Summer")
       # puts "1"
        assert_equal("1", print_rows["season"], "Season is not as expected. ")

      elsif (styleInfo["season"]=="Fall / Winter")
       # puts "2"
        assert_equal("2", print_rows["season"], "Season is not as expected. ")

      elsif (styleInfo["season"]=="Basic / Non-Seasonal")
        #puts "3"
        assert_equal("3", print_rows["season"], "Season is not as expected. ")

      else
        #puts "4"
        assert_equal(styleInfo["season"], print_rows["season"], "Season is not as expected. ")
      end
      # 		}
      # 		dbValidation=true;
      #
      # 	}
      #
      # 	if (dbValidation)
      # 		log.info("--Style fields stored as expected.");
      # 	else
      # 		Assert.assertTrue(false,"--Style fields not stored as expected.");
      #
      # }
    end
  end
end

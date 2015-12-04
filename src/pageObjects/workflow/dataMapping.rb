class DataMapping

  def self.map_columns
    $method = __method__
    return $browser.button(:text => "Map Columns")
  end

  def self.select_some_select_field(label, value)
    $method = __method__
    list_p = $browser.label(:text => "#{label}").parent
    list_p.select_list.select "#{value}"
  end

  def self.select_some_text_field(label)
    $method = __method__
    input_field_parent = $browser.label(:text => "#{label}").parent
    #puts input_field_parent.text_field.visible?
    return input_field_parent.text_field
  end

  def self.error_message(message)
    $method = __method__
    sleep 7
    #  browser.text.include?
    #puts $browser.text.include? message
    if ($browser.text.include? message)
      return "pass"
    else
      return "fail"
    end

    #return input_field_parent.text_field
  end

  def self.verify_field_mapping(field, value)
    $method = __method__
    label = $browser.label(:text => "#{field}").parent
    selected_val = label.select_list.selected_options.map(&:text)
    selected_val = selected_val.join(",")
    # puts "UI #{selected_val}"
    # puts value
    assert_equal(selected_val, value)
  end

  def self.maprequiredfieldscorrectly
    $method = __method__
    $browser.select_list(:id => "import_map_brandIndex").select 'Brand'
    $browser.select_list(:id => "import_map_styleNumIndex").select 'style_num'
    $browser.select_list(:id => "import_map_sizeIndex").select 'size'
    $browser.select_list(:id => "import_map_colorIndex").select 'color'
    $browser.select_list(:id => "import_map_businessDivisionIdIndex").select 'Business Division Id'
    $browser.select_list(:id => "import_map_businessDepartmentIdIndex").select 'Business Department Id'
    $browser.select_list(:id => "import_map_businessClassIdIndex").select 'Business Class Id'
    $browser.select_list(:id => "import_map_businessSubclassIdIndex").select 'Business Subclass Id'
  end
end


#
#   def self.map_columns
#     return $browser.button(:text => "Map Columns")
#   end
#   def self.brandNameLabel
#     return $browser.label(:xpath => "//label[@for='import_map_brandIndex']")
#
#   end
#   def self.noSizeError
#     return $browser.label(:xpath => "//label[@for='import_map_brandIndex']")
#
#   end
#   def self.invalidSizeError
#     return $browser.span(:xpath => "//span[@class='help-block has-error' and contains(.,'This value is not valid.')]")
#
#   end
#
#
#   def self.invalidWeightError
#     return $browser.span(:xpath => "//span[@class='help-block has-error' and contains(.,'This value should be a valid number.')]")
#
#   end
#   def self.sizeTooLongError
#     return $browser.span(:xpath => "//span[@class='help-block has-error' and contains(.,'This value is too long. It should have 20 characters or less.')]")
#
#   end
#   def self.brandMapping
#     return $browser.select_list(:id => "import_map_brandIndex")
#
#   end
#   def self.styleNumMapping
#     return $browser.select_list(:id => "import_map_styleNumIndex")
#
#   end
#   def self.styleNameMapping
#     return $browser.select_list(:id => "import_map_styleNameIndex")
#
#   end
#   def self.countryMapping
#     return $browser.select_list(:id => "import_map_countryIndex")
#
#   end
#   def self.weightMapping
#     return $browser.select_list(:id => "import_map_weightIndex")
#
#   end
#    def self.groupNumberMapping
#       return $browser.select_list(:id => "import_map_groupNumberIndex")
#
#     end
#      def self.seasonMapping
#         return $browser.select_list(:id => "import_map_seasonIndex")
#
#       end
#   #SKU mapping fields
#   def self.sizeMapping
#      return $browser.select_list(:id => "import_map_sizeIndex")
#
#    end
#    def self.colorMapping
#       return $browser.select_list(:id => "import_map_colorIndex")
#
#     end
#     def self.colorFamilyMapping
#        return $browser.select_list(:id => "import_map_colorFamilyIndex")
#
#      end
#      def self.nordstromColorFamilyMapping
#         return $browser.select_list(:id => "import_map_nordstromColorFamilyIndex")
#
#       end
#       def self.quantityMapping
#          return $browser.select_list(:id => "import_map_quantityIndex")
#
#        end
#        def self.upcMapping
#           return $browser.select_list(:id => "import_map_upcIndex")
#
#         end
#         def self.nordstromUpcMapping
#            return $browser.select_list(:id => "import_map_nordstromUpcIndex")
#
#          end
# # inventory mapping
#          def self.msrpMapping
#             return $browser.select_list(:id => "import_map_msrpIndex")
#
#           end
#           def self.priceMapping
#              return $browser.select_list(:id => "import_map_priceIndex")
#
#            end
#            def self.wholesalePriceMapping
#               return $browser.select_list(:id => "import_map_wholesalePriceIndex")
#
#             end
#             def self.discountMapping
#                return $browser.select_list(:id => "import_map_discountIndex")
#
#              end
#
#              def self.costMapping
#                 return $browser.select_list(:id => "import_map_costIndex")
#
#               end
#
#               def self.costMapping
#                  return $browser.select_list(:id => "import_map_costIndex")
#
#                end
#                def self.costMapping
#                   return $browser.select_list(:id => "import_map_costIndex")
#
#                 end
#
#
#
#
#
#
#
#      @FindBy(id = "import_map_carrierIndex")
#      public WebElement carrierMapping;
#
#      @FindBy(id = "import_map_estShippingCostIndex")
#      public WebElement estShippingCostMapping;
#
#      // business classification mapping fields
#      @FindBy(id = "import_map_businessDivisionIdIndex")
#      public WebElement divisionMapping;
#
#      @FindBy(id = "import_map_businessDepartmentIdIndex")
#      public WebElement departmentMapping;
#
#      @FindBy(id = "import_map_businessClassIdIndex")
#      public WebElement classMapping;
#
#      @FindBy(id = "import_map_businessSubclassIdIndex")
#      public WebElement subclassMapping;
#
#

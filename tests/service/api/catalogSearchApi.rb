i=0
k=0
j=0

puts $test_data['api_endpoint'].size
puts $test_data['Classification_parameters'].size
puts $test_data['Filter_parameters'].size
oldkeyword="nrhl"
newkeyword="search2"
while (i <$test_data['api_endpoint'].size) do
  if ("#{$test_data['api_endpoint'][i]}"=="/catalog/search/sort-data")
    api_endpoint=String.new
    api_endpoint=$test_data['api_endpoint'][i].to_s
    res2=Brand_api.request_http($test_data['base_url'][0], api_endpoint)
#  res2=res2.to_s.gsub("nrhl","search2")
    end_point_filename=api_endpoint.gsub("/", "_")
    puts end_point_filename
    Json_Functions.createJSONFile("#{$data_path}jsonfiles/catalog_search_api/sort_data_endpoint/js1#{end_point_filename}.json", res2)
    Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/catalog_search_api/sort_data_endpoint/js1#{end_point_filename}.json", oldkeyword, newkeyword)
    res3 = Brand_api.request($test_data['base_url'][1], api_endpoint, $test_data['auth'], $test_data['auth_code'], $test_data['cont_type'],
                             $test_data['cont_type_code'], $test_data['username'], $test_data['password'])
    Json_Functions.createJSONFile("#{$data_path}jsonfiles/catalog_search_api/sort_data_endpoint/js2#{end_point_filename}.json", res3)
    Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/catalog_search_api/sort_data_endpoint/js2#{end_point_filename}.json", oldkeyword, newkeyword)
    Json_Functions.compareJSON("#{$data_path}jsonfiles/catalog_search_api/sort_data_endpoint/js2#{end_point_filename}.json", "#{$data_path}jsonfiles/catalog_search_api/sort_data_endpoint/js1#{end_point_filename}.json", "#{$data_path}jsonfiles/catalog_search_api/sort_data_endpoint/diff#{end_point_filename}.json")
  end

#puts $test_data['api_endpoint'].size
  if ("#{$test_data['api_endpoint'][i]}".include? "filter")
    #puts "Pd"
    #search_parameter=$test_data['search_query']
    j=0
    api_endpoint=String.new
    $test_data['api_endpoint'][i]=$test_data['api_endpoint'][i].gsub("filter", "brand")
    puts $test_data['api_endpoint'][i]
    while (j <$test_data['Filter_parameters'].size) do
      if (j==0)
        api_endpoint="#{$test_data['api_endpoint'][i]}?#{$test_data['Filter_parameters'][j]}"
        puts api_endpoint

      end
      if (j>0 && j <=5)
        api_endpoint="#{api_endpoint}&#{$test_data['Filter_parameters'][j]}"
        puts api_endpoint
      end
      if (j>=6)
        api_endpoint="#{api_endpoint}&#{$test_data['Filter_parameters'][j]}"
        puts api_endpoint
        #api_endpoint="#{$test_data['api_endpoint'][i]}?#{$test_data['Classification_parameters'][j]}"
        #puts api_endpoint
        # res2 = Brand_api.request($test_data['base_url'][0],api_endpoint,$test_data['auth'],$test_data['auth_code'],$test_data['cont_type'],
        # $test_data['cont_type_code'],$test_data['username'],$test_data['password'])
        res2=Brand_api.request_http($test_data['base_url'][0], api_endpoint)
        #  res2=res2.to_s.gsub("nrhl","search2")
        end_point_filename=api_endpoint.gsub("/", "_")
        puts end_point_filename
        Json_Functions.createJSONFile("#{$data_path}jsonfiles/catalog_search_api/filter_endpoint/js1#{end_point_filename}.json", res2)
        Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/catalog_search_api/filter_endpoint/js1#{end_point_filename}.json", oldkeyword, newkeyword)
        res3 = Brand_api.request($test_data['base_url'][1], api_endpoint, $test_data['auth'], $test_data['auth_code'], $test_data['cont_type'],
                                 $test_data['cont_type_code'], $test_data['username'], $test_data['password'])
        Json_Functions.createJSONFile("#{$data_path}jsonfiles/catalog_search_api/filter_endpoint/js2#{end_point_filename}.json", res3)
        Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/catalog_search_api/filter_endpoint/js2#{end_point_filename}.json", oldkeyword, newkeyword)
        Json_Functions.compareJSON("#{$data_path}jsonfiles/catalog_search_api/filter_endpoint/js2#{end_point_filename}.json", "#{$data_path}jsonfiles/catalog_search_api/filter_endpoint/js1#{end_point_filename}.json", "#{$data_path}jsonfiles/catalog_search_api/filter_endpoint/diff#{end_point_filename}.json")

      end
      j=j+1
    end
    #puts $test_data['api_endpoint'][i]
  end
  if ("#{$test_data['api_endpoint'][i]}".include? "classification")
    api_endpoint=String.new

    while (j <$test_data['Classification_parameters'].size) do
      if (j==0)
        api_endpoint="#{$test_data['api_endpoint'][i]}?#{$test_data['Classification_parameters'][j]}"
        puts api_endpoint
        # res = Brand_api.request($test_data['base_url'][0],api_endpoint,$test_data['auth'],$test_data['auth_code'],$test_data['cont_type'],
        # $test_data['cont_type_code'],$test_data['username'],$test_data['password'])
        res=Brand_api.request_http($test_data['base_url'][0], api_endpoint)
        puts (res.to_s.include? "nrhl")
        #res=res.to_s.gsub("nrhl","search2")
        #Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/Events_Api_json/js2#{end_point_filename}.json",split_url2[2],split_url1[2])
        #puts res
        end_point_filename=api_endpoint.gsub("/", "_")
        puts end_point_filename

        Json_Functions.createJSONFile("#{$data_path}jsonfiles/catalog_search_api/classification_endpoint/js1#{end_point_filename}.json", res)
        Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/catalog_search_api/classification_endpoint/js1#{end_point_filename}.json", oldkeyword, newkeyword)
        res3 = Brand_api.request($test_data['base_url'][1], api_endpoint, $test_data['auth'], $test_data['auth_code'], $test_data['cont_type'],
                                 $test_data['cont_type_code'], $test_data['username'], $test_data['password'])

        Json_Functions.createJSONFile("#{$data_path}jsonfiles/catalog_search_api/classification_endpoint/js2#{end_point_filename}.json", res3)
        Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/catalog_search_api/classification_endpoint/js2#{end_point_filename}.json", oldkeyword, newkeyword)
        Json_Functions.compareJSON("#{$data_path}jsonfiles/catalog_search_api/classification_endpoint/js2#{end_point_filename}.json", "#{$data_path}jsonfiles/catalog_search_api/classification_endpoint/js1#{end_point_filename}.json", "#{$data_path}jsonfiles/catalog_search_api/classification_endpoint/diff#{end_point_filename}.json")

      end
      if (j>=1)
        api_endpoint="#{api_endpoint}&#{$test_data['Classification_parameters'][j]}"
        puts api_endpoint
        #api_endpoint="#{$test_data['api_endpoint'][i]}?#{$test_data['Classification_parameters'][j]}"
        #puts api_endpoint
        # res2 = Brand_api.request($test_data['base_url'][0],api_endpoint,$test_data['auth'],$test_data['auth_code'],$test_data['cont_type'],
        # $test_data['cont_type_code'],$test_data['username'],$test_data['password'])
        res2=Brand_api.request_http($test_data['base_url'][0], api_endpoint)
        #  res2=res2.to_s.gsub("nrhl","search2")
        end_point_filename=api_endpoint.gsub("/", "_")
        puts end_point_filename
        Json_Functions.createJSONFile("#{$data_path}jsonfiles/catalog_search_api/classification_endpoint/js1#{end_point_filename}.json", res2)
        Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/catalog_search_api/classification_endpoint/js1#{end_point_filename}.json", oldkeyword, newkeyword)
        res3 = Brand_api.request($test_data['base_url'][1], api_endpoint, $test_data['auth'], $test_data['auth_code'], $test_data['cont_type'],
                                 $test_data['cont_type_code'], $test_data['username'], $test_data['password'])
        Json_Functions.createJSONFile("#{$data_path}jsonfiles/catalog_search_api/classification_endpoint/js2#{end_point_filename}.json", res3)
        Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/catalog_search_api/classification_endpoint/js2#{end_point_filename}.json", oldkeyword, newkeyword)
        Json_Functions.compareJSON("#{$data_path}jsonfiles/catalog_search_api/classification_endpoint/js2#{end_point_filename}.json", "#{$data_path}jsonfiles/catalog_search_api/classification_endpoint/js1#{end_point_filename}.json", "#{$data_path}jsonfiles/catalog_search_api/classification_endpoint/diff#{end_point_filename}.json")

      end


      j=j+1
    end
  end
  if ("#{$test_data['api_endpoint'][i]}"=="/catalog/search")
    api_endpoint=String.new
    oldkeyword="nrhl"
    newkeyword="search2"
    j=0
    while (j <$test_data['Search_parameters'].size) do
      if (j==0)
        api_endpoint="#{$test_data['api_endpoint'][i]}?#{$test_data['Search_parameters'][j]}"
        puts api_endpoint
        # res = Brand_api.request($test_data['base_url'][0],api_endpoint,$test_data['auth'],$test_data['auth_code'],$test_data['cont_type'],
        # $test_data['cont_type_code'],$test_data['username'],$test_data['password'])
        res=Brand_api.request_http($test_data['base_url'][0], api_endpoint)
        puts (res.to_s.include? "nrhl")
        #res=res.to_s.gsub("nrhl","search2")
        #Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/Events_Api_json/js2#{end_point_filename}.json",split_url2[2],split_url1[2])
        #puts res
        end_point_filename=api_endpoint.gsub("/", "_")
        puts end_point_filename

        Json_Functions.createJSONFile("#{$data_path}jsonfiles/catalog_search_api/search_endpoint/js1#{end_point_filename}.json", res)
        Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/catalog_search_api/search_endpoint/js1#{end_point_filename}.json", oldkeyword, newkeyword)
        res3 = Brand_api.request($test_data['base_url'][1], api_endpoint, $test_data['auth'], $test_data['auth_code'], $test_data['cont_type'],
                                 $test_data['cont_type_code'], $test_data['username'], $test_data['password'])

        Json_Functions.createJSONFile("#{$data_path}jsonfiles/catalog_search_api/search_endpoint/js2#{end_point_filename}.json", res3)
        Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/catalog_search_api/search_endpoint/js2#{end_point_filename}.json", oldkeyword, newkeyword)
        Json_Functions.compareJSON("#{$data_path}jsonfiles/catalog_search_api/search_endpoint/js2#{end_point_filename}.json", "#{$data_path}jsonfiles/catalog_search_api/search_endpoint/js1#{end_point_filename}.json", "#{$data_path}jsonfiles/catalog_search_api/search_endpoint/diff#{end_point_filename}.json")

      end
      if (j>=1)
        api_endpoint="#{api_endpoint}&#{$test_data['Search_parameters'][j]}"
        puts api_endpoint
        #api_endpoint="#{$test_data['api_endpoint'][i]}?#{$test_data['Classification_parameters'][j]}"
        #puts api_endpoint
        # res2 = Brand_api.request($test_data['base_url'][0],api_endpoint,$test_data['auth'],$test_data['auth_code'],$test_data['cont_type'],
        # $test_data['cont_type_code'],$test_data['username'],$test_data['password'])
        res2=Brand_api.request_http($test_data['base_url'][0], api_endpoint)
        #  res2=res2.to_s.gsub("nrhl","search2")
        end_point_filename=api_endpoint.gsub("/", "_")
        puts end_point_filename
        Json_Functions.createJSONFile("#{$data_path}jsonfiles/catalog_search_api/search_endpoint/js1#{end_point_filename}.json", res2)
        Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/catalog_search_api/search_endpoint/js1#{end_point_filename}.json", oldkeyword, newkeyword)
        res3 = Brand_api.request($test_data['base_url'][1], api_endpoint, $test_data['auth'], $test_data['auth_code'], $test_data['cont_type'],
                                 $test_data['cont_type_code'], $test_data['username'], $test_data['password'])
        Json_Functions.createJSONFile("#{$data_path}jsonfiles/catalog_search_api/search_endpoint/js2#{end_point_filename}.json", res3)
        Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/catalog_search_api/search_endpoint/js2#{end_point_filename}.json", oldkeyword, newkeyword)
        Json_Functions.compareJSON("#{$data_path}jsonfiles/catalog_search_api/search_endpoint/js2#{end_point_filename}.json", "#{$data_path}jsonfiles/catalog_search_api/search_endpoint/js1#{end_point_filename}.json", "#{$data_path}jsonfiles/catalog_search_api/search_endpoint/diff#{end_point_filename}.json")

      end


      j=j+1
    end
  end
  if ("#{$test_data['api_endpoint'][i]}"=="/catalog/search/brand-data")
    #puts "Pd"
    #search_parameter=$test_data['search_query']
    j=0
    api_endpoint=String.new
    $test_data['api_endpoint'][i]=$test_data['api_endpoint'][i].gsub("filter", "brand")
    puts $test_data['api_endpoint'][i]
    while (j <$test_data['Brand_Search_parameters'].size) do
      if (j==0)
        api_endpoint="#{$test_data['api_endpoint'][i]}?#{$test_data['Brand_Search_parameters'][j]}"
        puts api_endpoint

      end
      if (j>0 && j <=5)
        api_endpoint="#{api_endpoint}&#{$test_data['Brand_Search_parameters'][j]}"
        puts api_endpoint
      end
      if (j>=6)
        api_endpoint="#{api_endpoint}&#{$test_data['Brand_Search_parameters'][j]}"
        puts api_endpoint
        #api_endpoint="#{$test_data['api_endpoint'][i]}?#{$test_data['Classification_parameters'][j]}"
        #puts api_endpoint
        # res2 = Brand_api.request($test_data['base_url'][0],api_endpoint,$test_data['auth'],$test_data['auth_code'],$test_data['cont_type'],
        # $test_data['cont_type_code'],$test_data['username'],$test_data['password'])
        res2=Brand_api.request_http($test_data['base_url'][0], api_endpoint)
        #  res2=res2.to_s.gsub("nrhl","search2")
        end_point_filename=api_endpoint.gsub("/", "_")
        puts end_point_filename
        Json_Functions.createJSONFile("#{$data_path}jsonfiles/catalog_search_api/brand_search_endpoint/js1#{end_point_filename}.json", res2)
        Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/catalog_search_api/brand_search_endpoint/js1#{end_point_filename}.json", oldkeyword, newkeyword)
        res3 = Brand_api.request($test_data['base_url'][1], api_endpoint, $test_data['auth'], $test_data['auth_code'], $test_data['cont_type'],
                                 $test_data['cont_type_code'], $test_data['username'], $test_data['password'])
        Json_Functions.createJSONFile("#{$data_path}jsonfiles/catalog_search_api/brand_search_endpoint/js2#{end_point_filename}.json", res3)
        Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/catalog_search_api/brand_search_endpoint/js2#{end_point_filename}.json", oldkeyword, newkeyword)
        Json_Functions.compareJSON("#{$data_path}jsonfiles/catalog_search_api/brand_search_endpoint/js2#{end_point_filename}.json", "#{$data_path}jsonfiles/catalog_search_api/brand_search_endpoint/js1#{end_point_filename}.json", "#{$data_path}jsonfiles/catalog_search_api/brand_search_endpoint/diff#{end_point_filename}.json")

      end
      j=j+1
    end
    #puts $test_data['api_endpoint'][i]
  end
  i=i+1
end

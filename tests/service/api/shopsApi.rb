i=0
while (i <$test_data['api_endpoint'].size) do
  puts $test_data['api_endpoint']

#puts $test_data['api_endpoint'].size
  if ($test_data['api_endpoint'][i].to_s.include? "preview-date")
    date=Time.now.strftime("%Y/%m/%d")
    puts date
    $test_data['api_endpoint'][i]="#{$test_data['api_endpoint'][i]}#{date}"
    puts $test_data['api_endpoint'][i]
  end

#res1=Brand_api.Login($test_data['base_url'][0],$test_data['username'],$test_data['password'],$test_data['auth'],$test_data['auth_code'])
  if ($test_data['base_url'][0].to_s.include? "https")
    res = Brand_api.request($test_data['base_url'][0], $test_data['api_endpoint'][i], $test_data['auth'], $test_data['auth_code'], $test_data['cont_type'],
                            $test_data['cont_type_code'], $test_data['username'], $test_data['password'])


  else
    res = Brand_api.request_http($test_data['base_url'][0], $test_data['api_endpoint'][i])
  end
  end_point_filename=$test_data['api_endpoint'][i].to_s.gsub("/", "_")
  puts end_point_filename
  Json_Functions.createJSONFile("#{$data_path}jsonfiles/shops_api_json/js1#{end_point_filename}.json", res)
#res2=Brand_api.Login($test_data['base_url'][1],$test_data['username'],$test_data['password'],$test_data['auth'],$test_data['auth_code'])

  res3 = Brand_api.request($test_data['base_url'][1], $test_data['api_endpoint'][i], $test_data['auth'], $test_data['auth_code'], $test_data['cont_type'],
                           $test_data['cont_type_code'], $test_data['username'], $test_data['password'])
# puts res3
# split_url1=$test_data['base_url'][0].split("/")
# split_url2=$test_data['base_url'][1].split("/")
# puts split_url1[2]
# puts split_url2[2]
# res3.to_s.gsub(split_url2[2],split_url1[2])
#Json_Functions.prettyJSON(res3)

# puts Json_Functions.prettyJSON(res3)
  Json_Functions.createJSONFile("#{$data_path}jsonfiles/shops_api_json/js2#{end_point_filename}.json", res3)
#Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/Events_Api_json/js2#{end_point_filename}.json",split_url2[2],split_url1[2])
  Json_Functions.compareJSON("#{$data_path}jsonfiles/shops_api_json/js2#{end_point_filename}.json", "#{$data_path}jsonfiles/shops_api_json/js1#{end_point_filename}.json", "#{$data_path}jsonfiles/shops_api_json/diff#{end_point_filename}.json")
# puts res.code
# puts "resposne body:"+res.body.to_s
# puts "resposne message:"+res.message.to_s
  i=i+1
end

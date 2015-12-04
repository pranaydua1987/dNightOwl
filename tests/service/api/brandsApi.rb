# res=Brand_api.request($test_data['base_url'],$test_data['api_endpoint'][0],$test_data['auth'],$test_data['auth_code'],$test_data['cont_type'],$test_data['application/json'])
# puts res
# base_url = 'https://origin.staging.hautelook.com'
# api_endpoint = 'api/events'
# auth = 'Authorization'
# aut_code = 'HWS a5a4d56c84b8d8cd0e0a0920edb8994c'
# cont_type = 'application/json'
# cont_type_code = 'vnd.com.hautelook.web+json;ver=4'
# puts $test_data['base_url']
# puts $test_data['api_endpoint'][0]
# puts $test_data['auth']
# puts $test_data['auth_code']
i=0
while (i <$test_data['api_endpoint'].size) do
  if ("#{$test_data['api_endpoint'][i]}".include? "brand_id")
    #puts "Pd"
    #search_parameter=$test_data['search_query']
    $test_data['api_endpoint'][i]=$test_data['api_endpoint'][i].gsub("brand_id", "#{$test_data['brand_id']}")
    #puts $test_data['api_endpoint'][i]
  end

#puts $test_data['api_endpoint'].size
  res1=Brand_api.Login($test_data['base_url'][0], $test_data['username'], $test_data['password'], $test_data['auth'], $test_data['auth_code'])

  res = Brand_api.request($test_data['base_url'][0], $test_data['api_endpoint'][i], $test_data['auth'], $test_data['auth_code'], $test_data['cont_type'],
                          $test_data['cont_type_code'], $test_data['username'], $test_data['password'])
  end_point_filename=$test_data['api_endpoint'][i].to_s.gsub("/", "_")
  puts end_point_filename
  Json_Functions.createJSONFile("#{$data_path}jsonfiles/js1#{end_point_filename}.json", res)
  res2=Brand_api.Login($test_data['base_url'][1], $test_data['username'], $test_data['password'], $test_data['auth'], $test_data['auth_code'])

  res3 = Brand_api.request($test_data['base_url'][1], $test_data['api_endpoint'][i], $test_data['auth'], $test_data['auth_code'], $test_data['cont_type'],
                           $test_data['cont_type_code'], $test_data['username'], $test_data['password'])
# puts res3
  split_url1=$test_data['base_url'][0].split("/")
  split_url2=$test_data['base_url'][1].split("/")
  puts split_url1[2]
  puts split_url2[2]
# res3.to_s.gsub(split_url2[2],split_url1[2])
#Json_Functions.prettyJSON(res3)

# puts Json_Functions.prettyJSON(res3)
  Json_Functions.createJSONFile("#{$data_path}jsonfiles/js2#{end_point_filename}.json", res3)
  Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/js2#{end_point_filename}.json", split_url2[2], split_url1[2])
  Json_Functions.compareJSON("#{$data_path}jsonfiles/js2#{end_point_filename}.json", "#{$data_path}jsonfiles/js1#{end_point_filename}.json", "#{$data_path}jsonfiles/diff#{end_point_filename}.json")
# puts res.code
# puts "resposne body:"+res.body.to_s
# puts "resposne message:"+res.message.to_s
  i=i+1
end

mysqlClient("10.224.5.188", "hautelook", "hautelook", "hautelook")
query="select event_id from events_styles inner join events using(event_id) where (Date(start_date) < CURRENT_DATE() and Date(end_date) > CURRENT_DATE() ) and event_status=50
 group by events_styles.event_id having count(events_styles.event_id >=1) order by end_date desc limit 1"
rs=Comman.query_results(query)
#puts rs
#puts rs["event_id"]
active_event_id=String.new
active_style_id=String.new

rs.each do |print_rows|
  puts "event_id:#{print_rows["event_id"]}"

  active_event_id=print_rows["event_id"].to_s
end
puts active_event_id
query1="select style_id from events_styles where event_id=#{active_event_id} limit 1"
rs1=Comman.query_results(query1)
rs1.each do |print_rows|
  puts "style_id:#{print_rows["style_id"]}"

  active_style_id=print_rows["style_id"].to_s
end


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


#puts $test_data['api_endpoint'].size
  if ("#{$test_data['api_endpoint'][i]}".include? "event_id")
    #puts "Pd"
    #search_parameter=$test_data['search_query']
    $test_data['api_endpoint'][i]=$test_data['api_endpoint'][i].gsub("event_id", "#{active_event_id}")
    #puts $test_data['api_endpoint'][i]
  end
  if ("#{$test_data['api_endpoint'][i]}".include? "style_id")
    $test_data['api_endpoint'][i]=$test_data['api_endpoint'][i].gsub("style_id", "#{active_style_id}")
  end
  res1=Brand_api.Login($test_data['base_url'][0], $test_data['username'], $test_data['password'], $test_data['auth'], $test_data['auth_code'])

  res = Brand_api.request($test_data['base_url'][0], $test_data['api_endpoint'][i], $test_data['auth'], $test_data['auth_code'], $test_data['cont_type'],
                          $test_data['cont_type_code'], $test_data['username'], $test_data['password'])
  end_point_filename=$test_data['api_endpoint'][i].to_s.gsub("/", "_")
  puts end_point_filename
  Json_Functions.createJSONFile("#{$dataDir}/jsonfiles/Events_Api_json/js1#{end_point_filename}.json", res)
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
  Json_Functions.createJSONFile("#{$dataDir}/jsonfiles/Events_Api_json/js2#{end_point_filename}.json", res3)
  Json_Functions.replaceurlinfile("#{$dataDir}/jsonfiles/Events_Api_json/js2#{end_point_filename}.json", split_url2[2], split_url1[2])
  Json_Functions.compareJSON("#{$dataDir}/jsonfiles/Events_Api_json/js2#{end_point_filename}.json", "#{$dataDir}/jsonfiles/Events_Api_json/js1#{end_point_filename}.json", "#{$dataDir}/jsonfiles/Events_Api_json/diff#{end_point_filename}.json")
# puts res.code
# puts "resposne body:"+res.body.to_s
# puts "resposne message:"+res.message.to_s
  i=i+1
end

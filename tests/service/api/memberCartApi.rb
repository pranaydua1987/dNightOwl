mysql_client("10.224.5.188", "hautelook", "hautelook", "hautelook")
rs=$mysql_client.query("select  event_id ,style_id ,sku,quantity from events inner join events_styles using(event_id) inner join skus using(style_id)  where (Date(start_date) < CURRENT_DATE() and Date(end_date) > CURRENT_DATE() ) and event_status=50 and skus.quantity >1
 group by events_styles.event_id having count(events_styles.event_id >=1) order by end_date  limit 1")
#puts rs
#puts rs["event_id"]
active_event_id=String.new
active_style_id=String.new
active_sku=String.new
active_quantity=String.new
rs.each do |print_rows|
  puts "event_id:#{print_rows["event_id"]}"

  active_event_id=print_rows["event_id"].to_s
  active_style_id=print_rows["style_id"].to_s
  active_sku=print_rows["sku"].to_s
  active_quantity=print_rows["quantity"].to_s
end
puts "Event_id:  #{active_event_id}"
puts "Style_id: #{active_style_id}"
puts "Sku : #{active_sku}"
# rs1=$mysql_client.query( "select style_id from events_styles inner join skus using(style_id) where event_id=#{active_event_id} and skus.quantity>1 limit 1")
# rs1.each do |print_rows|
# puts "style_id:#{print_rows["style_id"]}"
#
# active_style_id=print_rows["style_id"].to_s
# end
#
# rs2=$mysql_client.query( "select sku from skus where style_id=#{active_event_id} limit 1")
# rs2.each do |print_rows|
# puts "style_id:#{print_rows["style_id"]}"
#
# active_style_id=print_rows["style_id"].to_s
# end


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
j=0
while (j <$test_data['Post_api_endpoints'].size) do

  puts $test_data['Post_api_endpoints'][0]
#puts $test_data['api_endpoint'].size
  if ("#{$test_data['Post_api_endpoints'][j]}".include? "member_id")
    #puts "Pd"
    #search_parameter=$test_data['search_query']
    $test_data['Post_api_endpoints'][j]=$test_data['Post_api_endpoints'][j].gsub("member_id", "#{$test_data['member_id']}")
    puts $test_data['Post_api_endpoints'][j]
    #puts $test_data['api_endpoint'][i]
  end
  res1=Brand_api.Login($test_data['base_url'][0], $test_data['username'], $test_data['password'], $test_data['auth'], $test_data['auth_code'])
  puts res1

  Brand_api.add_cart_item($test_data['base_url'][0], $test_data['Post_api_endpoints'][j], $test_data['auth'], $test_data['auth_code'], $test_data['cont_type'],
                          $test_data['cont_type_code'], active_event_id, active_sku, "1")
#puts res2.code
# res = Brand_api.request($test_data['base_url'][0],$test_data['api_endpoint'][i],$test_data['auth'],$test_data['auth_code'],$test_data['cont_type'],
# $test_data['cont_type_code'],$test_data['username'],$test_data['password'])
  end_point_filename=$test_data['Post_api_endoints'][j].to_s.gsub("/", "_")
  puts end_point_filename
  Json_Functions.createJSONFile("#{$data_path}jsonfiles/Member_cart_Json/js1#{end_point_filename}.json", res2)
# res2=Brand_api.Login($test_data['base_url'][1],$test_data['username'],$test_data['password'],$test_data['auth'],$test_data['auth_code'])
#
# res3 = Brand_api.request($test_data['base_url'][1],$test_data['api_endpoint'][i],$test_data['auth'],$test_data['auth_code'],$test_data['cont_type'],
# $test_data['cont_type_code'],$test_data['username'],$test_data['password'])
# # puts res3
# split_url1=$test_data['base_url'][0].split("/")
# split_url2=$test_data['base_url'][1].split("/")
# puts split_url1[2]
# puts split_url2[2]
# # res3.to_s.gsub(split_url2[2],split_url1[2])
# #Json_Functions.prettyJSON(res3)
#
# # puts Json_Functions.prettyJSON(res3)
# Json_Functions.createJSONFile("#{$data_path}jsonfiles/Events_Api_json/js2#{end_point_filename}.json",res3)
# Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/Events_Api_json/js2#{end_point_filename}.json",split_url2[2],split_url1[2])
# Json_Functions.compareJSON("#{$data_path}jsonfiles/Events_Api_json/js2#{end_point_filename}.json", "#{$data_path}jsonfiles/Events_Api_json/js1#{end_point_filename}.json","#{$data_path}jsonfiles/Events_Api_json/diff#{end_point_filename}.json")
# puts res.code
# puts "resposne body:"+res.body.to_s
# puts "resposne message:"+res.message.to_s
  j=j+1
end
#  i=0
#  while(i <$test_data['api_endpoint'].size) do
#
#
# #puts $test_data['api_endpoint'].size
# if ("#{$test_data['api_endpoint'][i]}".include? "event_id")
#   #puts "Pd"
#   #search_parameter=$test_data['search_query']
# $test_data['api_endpoint'][i]=$test_data['api_endpoint'][i].gsub("event_id","#{active_event_id}")
# #puts $test_data['api_endpoint'][i]
# end
# if ("#{$test_data['api_endpoint'][i]}".include? "style_id")
# $test_data['api_endpoint'][i]=$test_data['api_endpoint'][i].gsub("style_id","#{active_style_id}")
# end
# res1=Brand_api.Login($test_data['base_url'][0],$test_data['username'],$test_data['password'],$test_data['auth'],$test_data['auth_code'])
#
# res = Brand_api.request($test_data['base_url'][0],$test_data['api_endpoint'][i],$test_data['auth'],$test_data['auth_code'],$test_data['cont_type'],
# $test_data['cont_type_code'],$test_data['username'],$test_data['password'])
# end_point_filename=$test_data['api_endpoint'][i].to_s.gsub("/","_")
# puts end_point_filename
# Json_Functions.createJSONFile("#{$data_path}jsonfiles/Events_Api_json/js1#{end_point_filename}.json",res)
# res2=Brand_api.Login($test_data['base_url'][1],$test_data['username'],$test_data['password'],$test_data['auth'],$test_data['auth_code'])
#
# res3 = Brand_api.request($test_data['base_url'][1],$test_data['api_endpoint'][i],$test_data['auth'],$test_data['auth_code'],$test_data['cont_type'],
# $test_data['cont_type_code'],$test_data['username'],$test_data['password'])
# # puts res3
# split_url1=$test_data['base_url'][0].split("/")
# split_url2=$test_data['base_url'][1].split("/")
# puts split_url1[2]
# puts split_url2[2]
# # res3.to_s.gsub(split_url2[2],split_url1[2])
# #Json_Functions.prettyJSON(res3)
#
# # puts Json_Functions.prettyJSON(res3)
# Json_Functions.createJSONFile("#{$data_path}jsonfiles/Events_Api_json/js2#{end_point_filename}.json",res3)
# Json_Functions.replaceurlinfile("#{$data_path}jsonfiles/Events_Api_json/js2#{end_point_filename}.json",split_url2[2],split_url1[2])
# Json_Functions.compareJSON("#{$data_path}jsonfiles/Events_Api_json/js2#{end_point_filename}.json", "#{$data_path}jsonfiles/Events_Api_json/js1#{end_point_filename}.json","#{$data_path}jsonfiles/Events_Api_json/diff#{end_point_filename}.json")
#  # puts res.code
# # puts "resposne body:"+res.body.to_s
# # puts "resposne message:"+res.message.to_s
# i=i+1
# end

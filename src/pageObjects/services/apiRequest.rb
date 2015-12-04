require "httparty_with_cookies"
require "json"

class Hl_api_test
  include HTTParty_with_cookies
end
$hl_api_client = Hl_api_test.new


class Brand_api
  def self.Login(base_url, username, password, auth, auth_code)
    $method = __method__

    # puts username
    # puts password
    $hl_api_client.post("#{base_url}/login",
                        :body => {"username" => username, "password" => password},
                        :headers => {auth => auth_code}
    )
  end

  def self.request(base_url, api_endpoint, auth, auth_code, cont_type, cont_type_code, username, password)
    #$hl_api_client = Hl_api_test.new
    $method = __method__
    # puts "Api_get_request"
    #  Brand_api.Login(base_url,username,password,auth,auth_code)
    puts "#{base_url}#{api_endpoint}"
    $hl_api_client.get("#{base_url}#{api_endpoint}",
                       :headers => {auth => auth_code, auth_code => cont_type_code, cont_type => cont_type_code}
    )
  end

  def self.request_http(base_url, api_endpoint)
    #$hl_api_client = Hl_api_test.new
    $method = __method__
    # puts "Api_get_request"
    #  Brand_api.Login(base_url,username,password,auth,auth_code)
    puts "#{base_url}#{api_endpoint}"
    $hl_api_client.get("#{base_url}#{api_endpoint}")
  end

  def self.add_cart_item(base_url, api_endpoint, auth, auth_code, cont_type, cont_type_code, event_id, sku, quantity)
    $method = __method__
    # puts "inside add cart item"
    # puts quantity
    # puts event_id
    # puts sku
    # puts "api endpoint :#{api_endpoint}"
    # puts "#{base_url}#{api_endpoint}"
    # puts auth
    # puts auth_code
    # res=Brand_api.Login($test_data['base_url'][0],$test_data['username'],$test_data['password'],$test_data['auth'],$test_data['auth_code'])
    # puts res

    begin
      puts $hl_api_client.post("#{base_url}#{api_endpoint}",
                               :body => {"eventId" => event_id, "sku" => sku, "quantity" => quantity},
                               :headers => {auth => auth_code}
      )
      # puts res5.code
    end

  rescue => e
    puts e
  end
end

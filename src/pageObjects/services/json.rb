require "json"
require 'yajl'
require 'json-compare'
class Json_Functions

  def self.prettyJSON(res)
    $method = __method__
    return JSON.pretty_generate(res)
  end

  def self.createJSONFile(fullpath, res)
    $method = __method__
    puts fullpath
    fJson = File.open(fullpath, "w")
    fJson.write(res.to_json)
    fJson.close

  end

  def self.replaceurlinfile(filepath, old_url, new_url)
    $method = __method__
    #  puts "replaceurlinfile"
    text = File.read(filepath)
    new_contents = text.gsub(old_url, new_url)
    fJson=File.open(filepath, "w")
    fJson.write(new_contents)
    fJson.close

  end

  def self.remove_file(filepath)
    $method = __method__
    File.delete(filepath)
  end

  def self.compareJSON(newFile, oldFile, fullpath)
    $method = __method__
    json1 = File.new(newFile, 'r')
    json2 = File.new(oldFile, 'r')
    newf, oldf = Yajl::Parser.parse(json1), Yajl::Parser.parse(json2)
    result = JsonCompare.get_diff(oldf, newf)
    if (result.size >0)

      #  Json_Functions.createJSONFile(fullpath,prettyJSON(result))

      Json_Functions.createJSONFile(fullpath, result)
    end
  end
end

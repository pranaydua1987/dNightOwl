class Command
    def self.constructDataFile(file)
      $currentTestName = File.basename(file,File.extname(file))
      @yaml_path = file.sub("#{$testDir}","")
      @yaml_path = @yaml_path.sub("tests","")
      @yaml_path = @yaml_path.sub(".rb",".yaml")
      return "#{$dataDir}#{@yaml_path}"
    end
end # class

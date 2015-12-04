class Path

  def self.getParentFolderPath()
    return File.expand_path('..', Dir.pwd)
  end

  def self.dataDirectoryPath(parentPath)
    return "#{parentPath}/src/bin/data"
  end

  def self.pageObjectPath(parentPath)
    return "#{parentPath}/src/pageObjects"
  end

  def self.testPath(parentPath)
    return "#{parentPath}/tests"
  end

end

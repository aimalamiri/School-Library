require 'fileutils'

class FileHandler
  def self.check_or_make_directory(name = 'data')
    FileUtils.mkdir_p(name)
    name
  end
end

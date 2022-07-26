class FileHandler
  def self.check_or_make_directory(name = 'data')
    Dir.mkdir(name) unless Dir.exist?(name)
    name
  end
end

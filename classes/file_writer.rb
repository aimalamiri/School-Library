require_relative './file_handler'

class FileWriter
  def initialize(file)
    @file = file
  end

  def write_data(data)
    dir = FileHandler.check_or_make_directory
    file = File.open("#{dir}/#{@file}", 'a+')
    file.puts data.to_json
    file.close
  end
end

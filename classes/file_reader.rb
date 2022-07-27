require_relative './file_handler'

class FileReader
  def initialize(file)
    @file = file
  end

  def read_data(_class_name)
    dir = FileHandler.check_or_make_directory
    list = []
    File.foreach("#{dir}/#{@file}") do |line|
      line = JSON.parse(line.to_json)
      object = nil
      JSON.load(line).each do |var, val|
        object = Object.const_get(val).new('', '') if var == 'class'
      end
      object.from_json!(line)
      list << object
    end
    list
  end

  def read_relations(persons, books)
    dir = FileHandler.check_or_make_directory
    list = []
    File.foreach("#{dir}/#{@file}") do |line|
      line = JSON.parse(line.to_json)
      object = nil
      JSON.load(line).each do |var, val|
        object = Object.const_get(val).new(nil, nil, nil) if var == 'class'
      end
      object.from_json!(line, persons, books)
      list << object
    end
    list
  end
end

require 'json'

module JSONable
  def to_json(*_args)
    hash = { class: self.class.name }
    instance_variables.each { |var| hash[var] = instance_variable_get(var) }
    hash.to_json
  end

  def from_json!(string)
    JSON.parse(string).each do |var, val|
      instance_variable_set(var, val) if var != 'class'
    end
  end
end

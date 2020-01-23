class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |field|
      getter(field)
      setter(field)
    end
  end

    def self.getter(*names)
    names.each do |field|
      define_method(field) do
        instance_variable_get("@#{field}")
      end
    end
  end

  def self.setter(*names)
    names.each do |field|
      define_method("#{field}=") do |value|
        instance_variable_set("@#{field}", value)
      end
    end
  end

end

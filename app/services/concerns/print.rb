module PrintDevice
  def print(object, device)
    if (object.is_a?(String))
      #"#{device.to_s.capitalize}Controller".constantize
      Object.const_get("#{device.to_s.capitalize}Controller")
        .print(object)
  Object.const_get("ClassName")
    elsif (object.is_a?(Article))
      #"#{device.to_s.capitalize}Controller".constantize
      Object.const_get("#{device.to_s.capitalize}Controller")
        .print("#{object.name}: #{object.price.to_s}")
    end
  end
end

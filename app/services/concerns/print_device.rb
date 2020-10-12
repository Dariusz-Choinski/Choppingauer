module PrintDevice
  def print(object, device)
    if (object.is_a?(String))
      FileDriver.write(device, object)
    elsif (object.is_a?(Article)  || object.is_a?(ShoppingCache))
      FileDriver.write(device,"#{object.name}: #{object.price.to_s}")
    end
  end
end

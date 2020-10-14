# frozen_string_literal: true

module Print
  def print(object, device)
    if object.is_a?(String)
      Object.const_get("#{device.to_s.capitalize}Controller")
            .print(device, object)
    elsif object.is_a?(Article) || object.is_a?(ShoppingCache)
      Object.const_get("#{device.to_s.capitalize}Controller")
            .print(device, "#{object.name}: #{object.price}")
    end
  end
end

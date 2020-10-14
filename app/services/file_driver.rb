class FileDriver
  def self.write(device, string)
    file = Rails.configuration.print_devices_path + device.to_s
    if device == :lcd
      File.write(file, string)
    elsif device == :printer && string != '0000000000'
      File.write(file, string + "\n", mode: 'a')
    elsif device == :printer && string == '0000000000'
      File.truncate(file, 0) if File.exist?(file)
    end
  end
end

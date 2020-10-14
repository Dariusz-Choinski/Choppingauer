class Drivers::File
  def self.print(device, string)
    FileDriver.write(device, string)
  end
end

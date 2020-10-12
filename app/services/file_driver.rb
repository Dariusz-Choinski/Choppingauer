class FileDriver
  def self.write(file, string)
    if (file == :lcd)
      File.write("#{Rails.root}/tmp/print_devices/#{file}", string)
    elsif (file == :printer && string != "0000000000")
      File.write("#{Rails.root}/tmp/print_devices/#{file}", string + "\n", mode: "a")
    elsif (file == :printer && string == "0000000000")
      File.truncate("#{Rails.root}/tmp/print_devices/#{file}", 0) if
        File.exist?("#{Rails.root}/tmp/print_devices/#{file}")
    end
  end
end

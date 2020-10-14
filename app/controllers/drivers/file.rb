# frozen_string_literal: true

module Drivers
  class File
    def self.print(device, string)
      FileDriver.write(device, string)
    end
  end
end

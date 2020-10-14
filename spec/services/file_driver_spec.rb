# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FileDriver do
  let(:dir) { Rails.configuration.print_devices_path }

  it 'write device :lcd to file lcd' do
    described_class.write(:lcd, 'test')
    text = File.read(dir + 'lcd')
    expect(text).to eq('test')
  end

  it 'write device :printer to file printer' do
    described_class.write(:printer, '0000000000')
    described_class.write(:printer, 'test')
    text = File.read(dir + 'printer')
    expect(text).to eq("test\n")
  end

  it 'write "0000000000" to clear printer buffer (file)' do
    described_class.write(:printer, '0000000000')
    text = File.read(dir + 'printer')
    expect(text).to be_empty
  end
end

require 'rails_helper'

RSpec.describe ShoppingExit do
  let(:file_driver) { class_double('FileDriver')
      .as_stubbed_const(:transfer_nested_constants => true) }

  before do
    [{ name: "XYZ", barcode: '1234567A', price: 7 },
     { name: "ABC", barcode: '1234567B', price: 3 }].each do |record|
      Article.create(record)
      ShoppingEnter.call(record[:barcode])
    end
    allow(file_driver).to receive(:write)
  end

  after do
    DatabaseCleaner.clean
  end

  it 'clear printer buffer' do
    described_class.call
    expect(file_driver).to have_received(:write).with(:printer, "0000000000")
  end

  it 'print article name and price to printer' do
    described_class.call
    expect(file_driver).to have_received(:write).with(:printer, "XYZ: 7")
  end

  it 'print article name and price to printer' do
    described_class.call
    expect(file_driver).to have_received(:write).with(:printer, "ABC: 3")
  end

  it 'print sum of shopping to lcd' do
    described_class.call
    expect(file_driver).to have_received(:write).with(:lcd, "10")
  end

  it 'print total: sum of shopping to printer' do
    described_class.call
    expect(file_driver).to have_received(:write).with(:printer, "total: 10")
  end

  it 'clear shopping cache' do
    described_class.call
    expect(ShoppingCache.all).to be_empty
  end
end

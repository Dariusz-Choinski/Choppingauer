require 'rails_helper'

RSpec.describe ShoppingEnter do
  before do
    Article.create(name: "XYZ", barcode: '12345678', price: 10)
  end

  after do
    DatabaseCleaner.clean
  end

  context 'barcode valid' do
    it 'print article name and price to lcd' do
      expect(FileDriver).to receive(:write).with(:lcd, "XYZ: 10")
      described_class.call("12345678")
    end

    it 'add article to shopping cache' do
      described_class.call("12345678")
      article = ShoppingCache.first
      expect(article.name).to eq("XYZ")
    end
  end

  context 'barcode invalid' do
    it 'print "Product not found" to lcd' do
      expect(FileDriver).to receive(:write).with(:lcd, "Product not found")
      described_class.call("11111111")
    end
  end
end

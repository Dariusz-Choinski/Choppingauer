# frozen_string_literal: true

class ShoppingEnter
  extend Print

  def self.call(barcode)
    article = Article.find_by_barcode(barcode)
    if article
      ShoppingCache.new({ name: article.name, price: article.price }).save
      print(article, :lcd)
    else
      print('Product not found', :lcd)
    end
  end
end

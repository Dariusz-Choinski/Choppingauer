class ShoppingExit
  extend Print

  def self.call
    print('0000000000', :printer) # clear printer buffer
    articles = ShoppingCache.all
    sum = 0
    articles.each do |article|
      sum += article.price
      print(article, :printer)
    end
    print("total: #{sum}", :printer)
    print(sum.to_s, :lcd)
    ShoppingCache.delete_all
  end
end

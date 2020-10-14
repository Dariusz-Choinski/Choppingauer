# frozen_string_literal: true

# cache storage is defined as parent class
class ShoppingCache < DbCache::Shopping
  # TODO
  # create common interface for all cache storages
  # for example:
  # def save
  # end
  #
  # def all
  # end
  #
  # def delete_all
  # end
end

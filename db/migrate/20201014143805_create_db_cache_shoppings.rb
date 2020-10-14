class CreateDbCacheShoppings < ActiveRecord::Migration[6.0]
  def change
    create_table :db_cache_shoppings do |t|
      t.string :name
      t.integer :price

      t.timestamps
    end
  end
end

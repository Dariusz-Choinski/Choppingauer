class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.text :name
      t.text :barcode
      t.integer :price

      t.timestamps
    end
  end
end

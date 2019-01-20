class AddIndexToBookShops < ActiveRecord::Migration[5.2]
  def change
    add_index :book_shops, [:book_id, :shop_id]
  end
end

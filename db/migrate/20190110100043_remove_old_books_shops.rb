class RemoveOldBooksShops < ActiveRecord::Migration[5.2]
  def change
    drop_table :books_shops
  end
end

class AddCopiesInStockToBookShops < ActiveRecord::Migration[5.2]
  def change
    add_column :book_shops, :copies_in_stock, :integer
  end
end

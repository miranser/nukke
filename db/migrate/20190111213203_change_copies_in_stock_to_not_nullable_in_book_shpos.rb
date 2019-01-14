class ChangeCopiesInStockToNotNullableInBookShpos < ActiveRecord::Migration[5.2]
  def change
    change_column :book_shops, :copies_in_stock, :integer, null: false
  end
end

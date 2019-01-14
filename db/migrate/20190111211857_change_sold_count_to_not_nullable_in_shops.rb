class ChangeSoldCountToNotNullableInShops < ActiveRecord::Migration[5.2]
  def change
    Shop.where(books_sold_count: nil).update_all(books_sold_count: 0)

    change_column :shops, :books_sold_count, :integer, null: false
  end
end

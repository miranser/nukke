class CreateJoinTableBooksShops < ActiveRecord::Migration[5.2]
  def change
    create_join_table :books, :shops do |t|
       t.index [:book_id, :shop_id]
       t.index [:shop_id, :book_id]
    end
  end
end

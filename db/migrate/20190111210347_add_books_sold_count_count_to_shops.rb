class AddBooksSoldCountCountToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :books_sold_count, :integer
  end
end

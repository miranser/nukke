class BookShop < ApplicationRecord
  attribute :copies_in_stock
  belongs_to :book
  belongs_to :shop

end

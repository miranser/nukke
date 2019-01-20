# frozen_string_literal: true

class BookShop < ApplicationRecord
  attribute :copies_in_stock
  belongs_to :book, autosave: true
  belongs_to :shop, autosave: true
  
  validates :copies_in_stock, presence: true,
                              numericality:
                              { only_integer: true,
                                greater_than_or_equal_to: 0 }
  validates :book, uniqueness: { scope: :shop }
end

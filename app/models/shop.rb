# frozen_string_literal: true

class Shop < ApplicationRecord
  has_many :book_shops, autosave: true
  has_many :books, through: :book_shops

  validates :books_sold_count, presence: true,
                               numericality:
                               { only_integer: true,
                                 greater_than_or_equal_to: 0 }
end

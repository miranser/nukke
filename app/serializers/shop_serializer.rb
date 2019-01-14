# frozen_string_literal: true

class ShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :books_sold_count
  has_many :books, each_serializer: BookSerializer, key: :books_in_stock, shop_id: :id
end

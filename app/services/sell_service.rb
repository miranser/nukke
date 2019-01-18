# frozen_string_literal: true

module SellService
  class << self
    def sell(shop, params)
      return false if params['books'].nil?

      ActiveRecord::Base.transaction do
        Array(params['books']).each do |book_to_sell|
          stock = BookShop.where('shop_id = ? AND book_id = ?', shop.id, book_to_sell[:book_id]).first
          stock.update!(copies_in_stock: stock.copies_in_stock - book_to_sell[:copies_sold])
          stock.shop.increment!(:books_sold_count, book_to_sell[:copies_sold])
          stock.save!
        end
      end
      true
    end
  end
end

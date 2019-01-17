# frozen_string_literal: true

module SellService
  class << self
    def sell(shop, params)
      return false if params['books'].nil?

      result = true
      Array(params['books']).each do |book_to_sell|
        stock = BookShop.where('shop_id = ? AND book_id = ?', shop.id, book_to_sell[:book_id]).first
        stock.decrement(:copies_in_stock, book_to_sell[:copies_sold])
        stock.shop.increment(:books_sold_count, book_to_sell[:copies_sold])
        # shop.increment(:books_sold_count, book_to_sell[:copies_sold])
        # shop.books.find(book_to_sell[:book_id])
        #   .decrement(:copies_in_stock, book_to_sell[:copies_sold])
        result = false unless stock.save
      end
      result
    end
  end
end

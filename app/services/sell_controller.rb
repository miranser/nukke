# frozen_string_literal: true

class SellController
  def sell_params
    params.permit(books: %i[book_id copies_sold])
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookShop, type: :model do
  let(:stock) { create(:book_shop) }

  it 'is valid with valid params' do
    expect(stock).to be_valid
  end

  it 'is invalid without book' do
    stock.book = nil
    expect(stock).to_not be_valid
  end

  it 'is invalid without shop' do
    stock.shop = nil
    expect(stock).to_not be_valid
  end

  it 'is invalid without copies in stock' do
    stock.copies_in_stock = nil
    expect(stock).to_not be_valid
  end

  it 'is inalid with negative copies value' do
    stock.copies_in_stock = -1
    expect(stock).to_not be_valid
  end

  it 'valid with unique book_id and shop_id' do
    same_stock = create(:book_shop)
    same_stock.book = stock.book
    same_stock.shop = stock.shop

    expect(same_stock).to_not be_valid
  end
end

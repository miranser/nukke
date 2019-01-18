# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookShop, type: :model do
  let(:stock) { create(:book_shop) }

  it 'valid with valid params' do
    expect(stock).to be_valid
  end

  it 'is not valid without book' do
    stock.book = nil
    expect(stock).to_not be_valid
  end

  it 'is not valid without shop' do
    stock.shop = nil
    expect(stock).to_not be_valid
  end

  it 'is not valid without copies in stock' do
    stock.copies_in_stock = nil
    expect(stock).to_not be_valid
  end

  it 'is not valid with negative copies value' do
    stock.copies_in_stock = -1
    expect(stock).to_not be_valid
  end
end

require 'rails_helper'

RSpec.describe Shop, type: :model do
  let(:shop) { create(:shop) }

  it 'is valid with valid params' do
    expect(shop).to be_valid
  end

  it 'is invalid without name' do
    shop.name = nil
    expect(shop).to_not be_valid
  end

  it 'is invalid without books sold count' do
    shop.books_sold_count = nil
    expect(shop).to_not be_valid
  end

  it 'is invalid with negative books sold count' do
    shop.books_sold_count = -1
    expect(shop).to_not be_valid
  end
end

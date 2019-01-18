require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book){ create(:book) }

  it 'is valid with valid parameters' do
    expect(book).to be_valid
  end

  it 'is not valid without title' do
    book.title = nil
    expect(book).to_not be_valid
  end

  it 'is not valid without autor' do
    book.author = nil
    expect(book).to_not be_valid
  end

  it 'belongs to publisher' do
    book.publisher = nil 
    expect(book).to_not be_falsy
  end
end

require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'belongs to publisher' do
    book = Book.new(title: 'title', author: 'author', publisher: nil)
    expect(book.valid?).to be_falsy
  end
end

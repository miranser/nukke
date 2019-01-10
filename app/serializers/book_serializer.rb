class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title
  has_many :shops
  belongs_to :publisher
end

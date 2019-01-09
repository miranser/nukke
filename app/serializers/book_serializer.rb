class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title

  belongs_to :publisher
end

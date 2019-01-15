# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title
  has_one :publisher, serializer: PublisherSerializer

end

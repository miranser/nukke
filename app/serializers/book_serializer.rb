# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title
  attribute :copies_in_stock, if: :show_copies?
  has_one :publisher, serializer: PublisherSerializer
  has_many :shops, key: :distributors
  

  def show_copies?
    !instance_options[:shop_id].nil?
  end
end

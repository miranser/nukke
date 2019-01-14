# frozen_string_literal: true

class PublisherSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :books
end

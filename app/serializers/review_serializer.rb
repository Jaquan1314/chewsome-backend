class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :text
  has_one :user
  has_one :restaurant
end

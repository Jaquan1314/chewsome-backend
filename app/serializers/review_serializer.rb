class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :text, :user, :restaurant
  has_one :user
  has_one :restaurant
end

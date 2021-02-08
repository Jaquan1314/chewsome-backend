class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :user, :restaurant
  has_one :user
  has_one :restaurant
end

class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :image_url, :location, :rating, :coordinates, :photos, :phone
end

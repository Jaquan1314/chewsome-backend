class User < ApplicationRecord
  has_many :reviews
  has_many :restaurants, through: :reviews

  has_many :favorites
  has_many :stores, through: :favorites, class_name: :Restaurant
end

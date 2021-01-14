class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  has_many :favorites
  has_many :persons, through: :favorites, class_name: :User
end

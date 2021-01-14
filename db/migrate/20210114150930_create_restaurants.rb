class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :url
      t.string :image_url
      t.string :location
      t.float :rating
      t.float :coordinates
      t.string :photos
      t.string :phone

      t.timestamps
    end
  end
end

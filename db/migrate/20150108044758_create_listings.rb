class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end

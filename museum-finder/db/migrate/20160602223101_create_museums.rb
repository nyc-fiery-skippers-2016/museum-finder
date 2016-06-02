class CreateMuseums < ActiveRecord::Migration
  def change
    create_table :museums do |t|
      t.string :name, null: false
      t.text :formatted_address, null: false
      t.string :formatted_phone_number
      t.string :lat
      t.string :ing
      t.text :opening_hours
      t.string :photos
      t.string :place_ids
      t.string :rates
      t.string :is_free
      t.references :category, index: true

      t.timestamps null: false
    end
    add_index :museums, :name, unique: true
  end
end

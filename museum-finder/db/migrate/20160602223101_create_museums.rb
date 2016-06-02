class CreateMuseums < ActiveRecord::Migration
  def change
    create_table :museums do |t|
      t.string :name, null: false
      t.string :formatted_address
      t.string :formatted_phone_number
      t.decimal :lat
      t.decimal :lng
      t.string :opening_hours
      t.string :photos
      t.string :place_id
      t.string :rates
      t.string :is_free
      t.references :category, index: true

      t.timestamps null: false
    end
    add_index :museums, :name, unique: true
  end
end

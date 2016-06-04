class CreateSpecials < ActiveRecord::Migration
  def change
    create_table :specials do |t|
      t.text :description
      t.references :museum, index: true

      t.timestamps null: false
    end
  end
end


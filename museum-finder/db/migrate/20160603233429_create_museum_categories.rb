class CreateMuseumCategories < ActiveRecord::Migration
  def change
    create_table :museum_categories do |t|
      t.references :museum, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class ChangePhotosColumnName < ActiveRecord::Migration
  def change
    rename_column :museums, :photos, :photo
  end
end

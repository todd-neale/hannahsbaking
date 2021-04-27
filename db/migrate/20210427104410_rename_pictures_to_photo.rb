class RenamePicturesToPhoto < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :pictures, :photo
  end
end

class AddPicturesStringToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :pictures, :string
  end
end

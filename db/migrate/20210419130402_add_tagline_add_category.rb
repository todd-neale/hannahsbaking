class AddTaglineAddCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :tagline, :string
    add_column :posts, :category, :decimal
  end
end

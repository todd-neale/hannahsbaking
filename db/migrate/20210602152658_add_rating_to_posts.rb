class AddRatingToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :rating, :integer, default: 0, null: false
  end
end

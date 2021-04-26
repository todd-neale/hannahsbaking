class AddTimeServingsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :servings, :integer
    add_column :posts, :preptime, :integer
    add_column :posts, :cooktime, :integer
  end
end

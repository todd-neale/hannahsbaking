class ChangeTimetoString < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :preptime, :string
    change_column :posts, :cooktime, :string
  end
end

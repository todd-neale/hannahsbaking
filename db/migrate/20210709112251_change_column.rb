class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :published, :boolean, :default => false
  end
end

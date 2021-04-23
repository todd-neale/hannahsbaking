class ChangeCategoryFromDecimaltoString < ActiveRecord::Migration[6.1]
  def change
        change_column :posts, :category, :string
  end
end

class RemoveColumnFromRecipe < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :preparation_time, :datetime
    remove_column :recipes, :preparation_time, :datetime
    add_column :recipes, :cooking_time, :string
    add_column :recipes, :cooking_time, :string
  end
end

class RemovePublicFromRecipe < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :public, :string
    add_column :recipes, :public, :boolean
  end
end

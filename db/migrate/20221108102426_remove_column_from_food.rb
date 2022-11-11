class RemoveColumnFromFood < ActiveRecord::Migration[7.0]
  def change
    remove_column :foods, :public, :boolean
  end
end

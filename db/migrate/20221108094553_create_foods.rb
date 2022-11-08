class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods, &:timestamps
  end
end

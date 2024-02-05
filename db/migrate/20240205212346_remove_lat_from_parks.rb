class RemoveLatFromParks < ActiveRecord::Migration[7.1]
  def change
    remove_column :parks, :lat, :string
  end
end

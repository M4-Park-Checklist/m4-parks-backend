class RemoveLonFromParks < ActiveRecord::Migration[7.1]
  def change
    remove_column :parks, :lon, :string
  end
end

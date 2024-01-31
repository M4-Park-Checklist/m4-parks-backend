class AddVisitedToParksUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :user_parks, :visited, :boolean
  end
end

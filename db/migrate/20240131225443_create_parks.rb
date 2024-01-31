class CreateParks < ActiveRecord::Migration[7.1]
  def change
    create_table :parks do |t|
      t.string :nps_id
      t.string :lat
      t.string :lon
      t.string :name

      t.timestamps
    end
  end
end

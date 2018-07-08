class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.time :work_from
      t.time :work_to

      t.timestamps
    end
  end
end

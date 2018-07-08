class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.datetime :reserve_start
      t.datetime :reserve_end
      t.belongs_to :table, foreign_key: true
      t.belongs_to :client, foreign_key: true

      t.timestamps
    end
  end
end

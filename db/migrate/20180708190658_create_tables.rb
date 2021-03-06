class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.string :code, unique: true
      t.belongs_to :restaurant, foreign_key: true

      t.timestamps
    end
  end
end

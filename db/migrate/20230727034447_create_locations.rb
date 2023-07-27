class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.references :person, null: false, foreign_key: { to_table: :people }

      t.timestamps
    end
  end
end

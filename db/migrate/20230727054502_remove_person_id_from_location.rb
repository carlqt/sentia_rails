class RemovePersonIdFromLocation < ActiveRecord::Migration[7.0]
  def change
    remove_reference :locations, :person, null: false, foreign_key: true
  end
end

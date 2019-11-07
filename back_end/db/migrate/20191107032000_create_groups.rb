class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :interest
      t.string :person
      t.integer :group_number
      t.integer :version

      t.timestamps
    end
  end
end

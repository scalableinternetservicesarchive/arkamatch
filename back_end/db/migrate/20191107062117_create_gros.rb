class CreateGros < ActiveRecord::Migration[6.0]
  def change
    create_table :gros do |t|
      t.integer :version

      t.timestamps
    end
  end
end

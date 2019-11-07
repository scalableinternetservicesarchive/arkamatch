class CreateGroupVersionNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :group_version_numbers do |t|
      t.integer :version

      t.timestamps
    end
  end
end

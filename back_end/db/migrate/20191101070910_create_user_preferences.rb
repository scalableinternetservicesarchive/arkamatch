class CreateUserPreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :user_preferences do |t|
      t.string :name
      t.string :interest

      t.timestamps

    end
  end
end

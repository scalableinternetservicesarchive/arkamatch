class CreateMyprofiles < ActiveRecord::Migration[6.0]
  def change
    create_table :myprofiles do |t|

      t.timestamps
    end
  end
end

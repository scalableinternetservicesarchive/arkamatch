class CreateUpdateViews < ActiveRecord::Migration[6.0]
  def change
    create_table :update_views do |t|

      t.timestamps
    end
  end
end

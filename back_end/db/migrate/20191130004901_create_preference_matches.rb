class CreatePreferenceMatches < ActiveRecord::Migration[6.0]
  def change
    drop_view :preference_matches, materialized: true
  end
end

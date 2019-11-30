class CreateSearchResults < ActiveRecord::Migration[6.0]
  def change
    drop_view :search_results
  end
end

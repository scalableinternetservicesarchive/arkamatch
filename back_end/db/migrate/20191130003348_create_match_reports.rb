class CreateMatchReports < ActiveRecord::Migration[6.0]
  def change
    create_view :match_reports, materialized: true
  end
end

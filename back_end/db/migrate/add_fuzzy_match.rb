class AddFuzzyMatch < ActiveRecord::Migration[6.0]
  def up
    execute "create extension fuzzystrmatch"
    execute "create extension pg_trgm"
  end
end


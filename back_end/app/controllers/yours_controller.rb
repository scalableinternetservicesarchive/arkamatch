class YoursController < ApplicationController

  def execute_sql(sql)
    results = ActiveRecord::Base.connection.execute(sql)
    results.each do |res|
      puts res
    end
    return results
  end

    def profile
      # cache.fetch("foo", force: true, raw: true) do
      #   :bar
      # end
      @account = current_user
      execute_sql("create extension IF NOT EXISTS fuzzystrmatch;")
      execute_sql("create extension IF NOT EXISTS pg_trgm;")
      
      
    if Rails.cache.fetch(current_user).nil?
        @preferences=execute_sql("SELECT up.interest,
          (SELECT COUNT(*)
            FROM user_preferences up1
             WHERE up.interest=up1.interest AND name!='#{current_user.username}')
          AS number_of_people_interested
    FROM user_preferences up
    WHERE name= '#{current_user.username}'
    ORDER BY number_of_people_interested DESC").to_a
    Rails.cache.write(current_user, @preferences, expires_in: 1.minute)
    else
      @preferences=Rails.cache.fetch(current_user)
      @cached="te"
    end
    end
   end
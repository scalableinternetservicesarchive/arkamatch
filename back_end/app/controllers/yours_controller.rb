class YoursController < ApplicationController

  def execute_sql(sql)
    results = ActiveRecord::Base.connection.execute(sql)
    results.each do |res|
      puts res
    end
    return results
  end

    def profile
      @account = current_user
      execute_sql("create extension IF NOT EXISTS fuzzystrmatch;")
      execute_sql("create extension IF NOT EXISTS pg_trgm;")
      @preferences=execute_sql("SELECT up.interest,
                                    (SELECT COUNT(*)
                                      FROM user_preferences up1
                                       WHERE up.interest=up1.interest AND name!='#{current_user.username}')
                                    AS number_of_people_interested
                              FROM user_preferences up
                              WHERE name= '#{current_user.username}'
                              ORDER BY number_of_people_interested DESC").to_a

    end
   end
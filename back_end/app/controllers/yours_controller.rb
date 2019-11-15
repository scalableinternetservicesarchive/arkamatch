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
      @preferences=execute_sql("SELECT interest
                              FROM user_preferences
                              WHERE name= '#{current_user.username}'").to_a
    end
   end
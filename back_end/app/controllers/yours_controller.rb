class YoursController < ApplicationController
    def profile
      @account = current_user
    end
   end
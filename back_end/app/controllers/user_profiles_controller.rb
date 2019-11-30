class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:show, :edit, :update, :destroy]

  def execute_sql(sql)
    results = ActiveRecord::Base.connection.execute(sql)
    results.each do |res|
      puts res
    end
    return results
  end
  # GET /user_profiles
  # GET /user_profiles.json
  def index
    # @user_profiles = UserProfile.all
    puts params
    @preferences=execute_sql("SELECT up1.interest
        FROM user_preferences up1
        JOIN user_preferences up2
        ON up2.name='#{current_user.username}' AND up1.name='#{params[:name]}' AND up1.interest=up2.interest").to_a
      @num_interests=execute_sql("SELECT count(*)
          FROM user_preferences up1
          JOIN user_preferences up2
          ON up2.name='#{current_user.username}' AND up1.name='#{params[:name]}' AND up1.interest=up2.interest").to_a[0]
        unless  @preferences.empty?
          account=execute_sql("SELECT email,username 
            FROM users
            where username='#{params[:name]}'").to_a[0]
            unless account.nil?
            gravatar_id = Digest::MD5::hexdigest(account["email"]).downcase
            @gravatar_url="https://gravatar.com/avatar/#{gravatar_id}.png"
            @user_name=account["username"]
            puts @gravatar_url
            end
        end
  end

  # GET /user_profiles/1
  # GET /user_profiles/1.json
  def show
    # puts params
    # @preferences=execute_sql("SELECT up1.interest
    #     FROM user_preferences up1
    #     JOIN user_preferences up2
    #     ON up2.name='#{current_user.username}' AND up1.name='#{params[:name]}' AND up1.interest=up2.interest").to_a
  end

  # GET /user_profiles/new
  def new
    # @user_profile = UserProfile.new
  end

  # GET /user_profiles/1/edit
  def edit
  end

  # POST /user_profiles
  # POST /user_profiles.json
  def create
    # @user_profile = UserProfile.new(user_profile_params)

    # respond_to do |format|
    #   if @user_profile.save
    #     format.html { redirect_to @user_profile, notice: 'User profile was successfully created.' }
    #     format.json { render :show, status: :created, location: @user_profile }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user_profile.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /user_profiles/1
  # PATCH/PUT /user_profiles/1.json
  def update
    # respond_to do |format|
    #   if @user_profile.update(user_profile_params)
    #     format.html { redirect_to @user_profile, notice: 'User profile was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @user_profile }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @user_profile.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.json
  def destroy
    # @user_profile.destroy
    # respond_to do |format|
    #   format.html { redirect_to user_profiles_url, notice: 'User profile was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      # @user_profile = UserProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_profile_params
      # params.fetch(:user_profile, {:name})
    end
end

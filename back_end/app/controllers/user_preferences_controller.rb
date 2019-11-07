class UserPreferencesController < ApplicationController
  before_action :set_user_preference, only: [:show, :edit, :update, :destroy]

  # GET /user_preferences
  # GET /user_preferences.json
  def index
    @user_preferences = UserPreference.all
  end

  # GET /user_preferences/1
  # GET /user_preferences/1.json
  def execute_sql(sql)
    results = ActiveRecord::Base.connection.execute(sql)
    results.each do |res|
      puts res
    end
    return results
  end

  def show
    # execute_sql("create extension fuzzystrmatch")

    @similar_preferences=execute_sql("SELECT interest,count(*) as number_of_people_interested
                              FROM user_preferences
                              WHERE soundex(interest) = soundex('#{@user_preference.interest}')
                               GROUP BY interest
                                ORDER BY number_of_people_interested DESC")

    words_in_string=@user_preference.interest.split(' ')

    @preferences=execute_sql("SELECT interest
                              FROM user_preferences
                              WHERE name= '#{@user_preference.name}'")
    # puts @preferences
    @matches=execute_sql("SELECT up2.name as match, count(*) as num_matches
                              FROM user_preferences up1
                              JOIN user_preferences up2
                              ON up1.name = '#{@user_preference.name}'
                              AND up2.name != '#{@user_preference.name}'
                              AND up1.interest=up2.interest
                              GROUP BY up1.name,up2.name
                              ORDER BY num_matches DESC")
    user_with_preference=execute_sql("SELECT name
                              FROM user_preferences
                              WHERE interest= 'a' ").to_a
    user_with_preference.each { |thing| puts thing }
    num_users_with_interest= user_with_preference.length
    user_with_preference.each { |thing| puts thing }

    group_size=2
    num_groups=num_users_with_interest/group_size
    current_end_of_array=num_users_with_interest
    puts "num_groups=",num_groups,num_users_with_interest
    (0...num_groups).each do |group_num|
      puts group_num
      (1..group_size).each do
        chosen_one=rand(0...current_end_of_array)
        puts user_with_preference[chosen_one],group_num
        current_end_of_array=current_end_of_array-1
        user_with_preference[chosen_one]=user_with_preference[current_end_of_array]
      end
      end


  end

  # GET /user_preferences/new
  def new
    @user_preference = UserPreference.new
  end

  # GET /user_preferences/1/edit
  def edit
  end

  # POST /user_preferences
  # POST /user_preferences.json
  def create
    @user_preference = UserPreference.new(user_preference_params)

    respond_to do |format|
      if @user_preference.save
        format.html { redirect_to @user_preference, notice: 'User preference was successfully created.' }
        format.json { render :show, status: :created, location: @user_preference }
      else
        format.html { render :new }
        format.json { render json: @user_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_preferences/1
  # PATCH/PUT /user_preferences/1.json
  def update
    respond_to do |format|
      if @user_preference.update(user_preference_params)
        format.html { redirect_to @user_preference, notice: 'User preference was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_preference }
      else
        format.html { render :edit }
        format.json { render json: @user_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_preferences/1
  # DELETE /user_preferences/1.json
  def destroy
    @user_preference.destroy
    respond_to do |format|
      format.html { redirect_to user_preferences_url, notice: 'User preference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_preference
      @user_preference = UserPreference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_preference_params
      params.require(:user_preference).permit(:name, :interest)
    end
end

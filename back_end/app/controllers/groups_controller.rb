class GroupsController < ApplicationController

  before_action :set_group, only: [:show, :edit, :update, :destroy]
  # before_filter :authorize_admin

  def execute_sql(sql)
    results = ActiveRecord::Base.connection.execute(sql)
    results.each do |res|
      puts res
    end
    return results
  end


  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  def k_group_size
  2
  end

  def get_group_name(interest,version,group_num)
    interest+"."+version.to_s+"."+group_num.to_s
  end

  # Takes in a list of all the users interested in a particular interest and creates random groups.
  def create_groups(interest, user_with_preference,version,group_creating_time)
    num_users_with_interest= user_with_preference.length
    num_groups=num_users_with_interest/k_group_size
    current_end_of_array=num_users_with_interest
    group_entries=[]
    (0...num_groups).each do |group_num|
      group_name=get_group_name(interest,version,group_num)
      json={:name => group_name}
      room =Room.new json
      unless room.save
        format.html { redirect_to @group, notice: 'An error ocored with group creation.' }
        break
      end
      puts group_num
      (1..k_group_size).each do
        chosen_one=rand(0...current_end_of_array)
        group_entries.push("('#{interest}', '#{user_with_preference[chosen_one]["name"]}', #{group_num}, #{version},'#{group_creating_time}','#{group_creating_time}')")
        current_end_of_array=current_end_of_array-1
        user_with_preference[chosen_one]=user_with_preference[current_end_of_array]
      end
    end
    return group_entries
  end

  # GET /groups/new
  def new
    authorize_admin
    # redirect_to rooms_url, alert: 'Access Denied'
    # format.html { redirect_to user_preferences_url, notice: 'User preference was successfully destroyed.' }

    @group = Group.new
    old_version=execute_sql("SELECT version from group_version_numbers order by version DESC limit 1").to_a
    new_version=1
    group_creating_time=Time.now
    unless old_version.length == 0
          new_version=old_version[0]["version"]+1
    end
    # Fetch all interests that have at-least k_group_size people interested.
    interests=execute_sql("SELECT interest
                              FROM user_preferences
                              GROUP BY interest
                              HAVING count(*)>#{k_group_size}")
    # Fetch all the users interested and create random groups
    group_entries=[]
    interests.each do |interest|
      interest=interest["interest"]
      users_interested=execute_sql("SELECT name
                              FROM user_preferences
                              WHERE interest= '#{interest}' ").to_a
      # Add the returned entries to group_entries
      group_entries|=create_groups(interest,users_interested,new_version,group_creating_time)
    end
    unless group_entries.empty?
      # Add the newly created groups to the table
      insert_groups_query = "INSERT INTO groups (interest, person, group_number,version,created_at,updated_at)\n VALUES\n"
      insert_groups_query += "#{group_entries * ",\n"}"
      execute_sql(insert_groups_query)
      # Add the latest version number to the values after inserting all the new groups
      execute_sql("INSERT INTO group_version_numbers (version,created_at,updated_at) VALUES (#{new_version},'#{group_creating_time}','#{group_creating_time}')")
    end
  end

  # GET /groups/1/edit
  def edit
    authorize_admin

  end

  # POST /groups
  # POST /groups.json
  def create
    authorize_admin

    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    authorize_admin

    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    authorize_admin
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

  def authorize_admin
    unless current_user.username=="system_admin"
    redirect_to rooms_url, alert: 'Access Denied'
      end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:interest, :person, :group_number, :version)
    end
end
class ApplicationController < ActionController::Base
end
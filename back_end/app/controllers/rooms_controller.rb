class RoomsController < ApplicationController
    # Loads:
    # @rooms = all rooms
    # @room = current room when applicable
    before_action :load_entities

    def execute_sql(sql)
      results = ActiveRecord::Base.connection.execute(sql)
      results.each do |res|
        puts res
      end
      return results
    end

    def get_rooms
      room_names=execute_sql("select CONCAT(interest,'.',version,'.', group_number)
                                FROM groups
                                WHERE
                                person='#{current_user.username}'
                                AND
                                version in (SELECT version from group_version_numbers order by version DESC limit 1)
").to_a
      puts room_names
      room_names_=[]
      room_names.each do |name|
        room_names_.push(name["concat"])
      end
      @rooms = Room.where(name: room_names_)
    end


    def get_members
      @room_members=execute_sql("select DISTINCT person
                                FROM groups JOIN
                                rooms ON
                                CONCAT(interest,'.',version,'.', group_number)=rooms.name
                                AND rooms.id=#{params[:id]}"
                                ).to_a
      # puts @room_members
    end

    def index
      get_rooms
    end
  
    def new
      @room = Room.new
    end
  
    def create
      @room = Room.new permitted_parameters
      puts permitted_parameters
      if @room.save
        flash[:success] = "Room #{@room.name} was created successfully"
        redirect_to rooms_path
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @room.update_attributes(permitted_parameters)
        flash[:success] = "Room #{@room.name} was updated successfully"
        redirect_to rooms_path
      else
        render :new
      end
    end
  
	def show
		@room_message = RoomMessage.new room: @room
		@room_messages = @room.room_messages.includes(:user)
	end
	
    protected
  
    def load_entities
      get_rooms
      @room = Room.find(params[:id]) if params[:id]
      get_members if params[:id]
    end
  
    def permitted_parameters
      params.require(:room).permit(:name)
    end
end
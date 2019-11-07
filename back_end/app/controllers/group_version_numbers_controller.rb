class GroupVersionNumbersController < ApplicationController
  before_action :set_group_version_number, only: [:show, :edit, :update, :destroy]

  # GET /group_version_numbers
  # GET /group_version_numbers.json
  def index
    @group_version_numbers = GroupVersionNumber.all
  end

  # GET /group_version_numbers/1
  # GET /group_version_numbers/1.json
  def show
  end

  # GET /group_version_numbers/new
  def new
    @group_version_number = GroupVersionNumber.new
  end

  # GET /group_version_numbers/1/edit
  def edit
  end

  # POST /group_version_numbers
  # POST /group_version_numbers.json
  def create
    @group_version_number = GroupVersionNumber.new(group_version_number_params)

    respond_to do |format|
      if @group_version_number.save
        format.html { redirect_to @group_version_number, notice: 'Group version number was successfully created.' }
        format.json { render :show, status: :created, location: @group_version_number }
      else
        format.html { render :new }
        format.json { render json: @group_version_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_version_numbers/1
  # PATCH/PUT /group_version_numbers/1.json
  def update
    respond_to do |format|
      if @group_version_number.update(group_version_number_params)
        format.html { redirect_to @group_version_number, notice: 'Group version number was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_version_number }
      else
        format.html { render :edit }
        format.json { render json: @group_version_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_version_numbers/1
  # DELETE /group_version_numbers/1.json
  def destroy
    @group_version_number.destroy
    respond_to do |format|
      format.html { redirect_to group_version_numbers_url, notice: 'Group version number was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_version_number
      @group_version_number = GroupVersionNumber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_version_number_params
      params.require(:group_version_number).permit(:version)
    end
end

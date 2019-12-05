class UpdateViewsController < ApplicationController
  before_action :set_update_view, only: [:show, :edit, :update, :destroy]

  # GET /update_views
  # GET /update_views.json
  def index
    @update_views = UpdateView.all
  end

  # GET /update_views/1
  # GET /update_views/1.json
  def show
  end

  # GET /update_views/new
  def new
    MatchReports.refresh
    @update_view = UpdateView.new

  end


  def self.refresh
    Scenic
      .database
      .refresh_materialized_view(table_name, concurrently: false)
  end

  # GET /update_views/1/edit
  def edit
  end

  # POST /update_views
  # POST /update_views.json
  def create
    @update_view = UpdateView.new(update_view_params)

    respond_to do |format|
      if @update_view.save
        format.html { redirect_to @update_view, notice: 'Update view was successfully created.' }
        format.json { render :show, status: :created, location: @update_view }
      else
        format.html { render :new }
        format.json { render json: @update_view.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /update_views/1
  # PATCH/PUT /update_views/1.json
  def update
    respond_to do |format|
      if @update_view.update(update_view_params)
        format.html { redirect_to @update_view, notice: 'Update view was successfully updated.' }
        format.json { render :show, status: :ok, location: @update_view }
      else
        format.html { render :edit }
        format.json { render json: @update_view.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /update_views/1
  # DELETE /update_views/1.json
  def destroy
    @update_view.destroy
    respond_to do |format|
      format.html { redirect_to update_views_url, notice: 'Update view was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_update_view
      @update_view = UpdateView.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def update_view_params
      params.fetch(:update_view, {})
    end
end

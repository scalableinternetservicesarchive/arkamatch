class GrosController < ApplicationController
  before_action :set_gro, only: [:show, :edit, :update, :destroy]

  # GET /gros
  # GET /gros.json
  def index
    @gros = Gro.all
  end

  # GET /gros/1
  # GET /gros/1.json
  def show
  end

  # GET /gros/new
  def new
    @gro = Gro.new
  end

  # GET /gros/1/edit
  def edit
  end

  # POST /gros
  # POST /gros.json
  def create
    @gro = Gro.new(gro_params)

    respond_to do |format|
      if @gro.save
        format.html { redirect_to @gro, notice: 'Gro was successfully created.' }
        format.json { render :show, status: :created, location: @gro }
      else
        format.html { render :new }
        format.json { render json: @gro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gros/1
  # PATCH/PUT /gros/1.json
  def update
    respond_to do |format|
      if @gro.update(gro_params)
        format.html { redirect_to @gro, notice: 'Gro was successfully updated.' }
        format.json { render :show, status: :ok, location: @gro }
      else
        format.html { render :edit }
        format.json { render json: @gro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gros/1
  # DELETE /gros/1.json
  def destroy
    @gro.destroy
    respond_to do |format|
      format.html { redirect_to gros_url, notice: 'Gro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gro
      @gro = Gro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gro_params
      params.require(:gro).permit(:version)
    end
end

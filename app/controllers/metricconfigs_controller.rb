class MetricconfigsController < ApplicationController
  before_action :set_metricconfig, only: [:show, :edit, :update, :destroy]

  # GET /metricconfigs
  def index
    @metricconfigs = Metricconfig.paginate(page: params[:page])
  end

  # GET /metricconfigs/1
  def show
    @metricconfig = Metricconfig.find(params[:id])
    @metric = @metricconfig.metricconfigs.paginate(page: params[:page])
  end

  # GET /metricconfigs/new
  def new
    @metricconfig = Metricconfig.new
  end

  # GET /metricconfigs/1/edit
  def edit
  end

  # POST /metricconfigs
  def create
    @metricconfig = Metricconfig.new(metricconfig_params)

    if @metricconfig.save
      redirect_to @metricconfig, notice: 'Metricconfig was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /metricconfigs/1
  def update
    if @metricconfig.update(metricconfig_params)
      redirect_to @metricconfig, notice: 'Metricconfig was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /metricconfigs/1
  def destroy
    @metricconfig.destroy
    redirect_to metricconfigs_url, notice: 'Metricconfig was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metricconfig
      @metricconfig = Metricconfig.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def metricconfig_params
      params[:metricconfig]
    end
end

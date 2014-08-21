class MetricConfigsController < ApplicationController
  before_action :set_metric_config, only: [:show, :edit, :update, :destroy]

  # GET /metric_configs
  def index
    @metric_configs = MetricConfig.paginate(page: params[:page])
  end

  # GET /metric_configs/1
  def show
    @metric_configs = MetricConfig.find(params[:id])
    @metric = @metric_configs.metric_configs.paginate(page: params[:page])
  end

  # GET /metric_configs/new
  def new
    @metric_config = MetricConfig.new
  end

  # GET /metric_configs/1/edit
  def edit
  end

  # POST /metric_configs
  # POST /metric_configs.json
  def create
    @metric_config = MetricConfig.new(metric_configs_params)

    respond_to do |format|
      if @metric_config.save
        format.html { redirect_to @metric_config, notice: 'Metric config was successfully created.' }
        format.json { render action: 'show', status: :created, location: @metric_configs }
      else
        format.html { render action: 'new' }
        format.json { render json: @metric_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metric_configs/1
  # PATCH/PUT /metric_configs/1.json
  def update
    respond_to do |format|
      if @metric_config.update(metric_configs_params)
        format.html { redirect_to @metric_config, notice: 'Metric config was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @metric_config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metric_configs/1
  # DELETE /metric_configs/1.json
  def destroy
    @metric_config.destroy
    respond_to do |format|
      format.html { redirect_to metric_configs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metric_config
      @metric_config = MetricConfig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def metric_configs_params
      params.require(:metric_config).permit(:user_id, :value, :orderby, :profiledisplay, :updateable)
    end
end

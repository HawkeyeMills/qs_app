class MetricsController < ApplicationController
  before_action :set_metric, only: [:show, :edit, :update, :destroy]

  # GET /metrics
  def index    
    @dateToShow = Date.today
    @metrics = current_user.metrics.where(metricdate: @dateToShow)
    @metricconfigs = current_user.metric_configs
  end

  # GET /metrics/1
  def show
    @dateToShow = Date.today
    @metricconfigs = current_user.metric_configs
    @metrics = current_user.metrics.where(metricdate: @dateToShow)
  end

  # GET /metrics/new
  def new
    @metricconfigs = current_user.metric_configs.where(updateable: '1')
    @metric = Metric.new(params[:metric_config_id])
  end

  # GET /metrics/1/edit
  def edit
    @metricconfigs = current_user.metric_configs
    #render :text => @metricconfigs.count and return false
    @metric = Metric.find(params[:id])
    @metricconfigs = current_user.metric_configs
  end

  # POST /metrics
  def create
    #render :text => params and return false
    @metric = Metric.new(metric_params)
    if @metric.save
      redirect_to @metric, notice: 'Metric was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /metrics/1
  def update
    if @metric.update(metric_params)
      redirect_to @metric, notice: 'Metric was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /metrics/1
  def destroy
    @metric.destroy
    redirect_to metrics_url, notice: 'Metric was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metric
      @metric = Metric.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def metric_params
      #params[:metric]
      params.require(:metric).permit(:value, :metricdate, :metric_config_id)
    end
end

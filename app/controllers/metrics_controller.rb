class MetricsController < ApplicationController
  before_action :set_metric, only: [:show, :edit, :update, :destroy]

  # GET /metrics
  def index    
    #@metrics = Metric.paginate(page: params[:page])
    #@metricconfigs = MetricConfig.all
    #@metricconfigs = @metrics.metric_configs.paginate(page: params[:page])
    #@metricconfigs = @metrics.metric_configs.build(params[:metricconfig])
    +#@metrics = MetricConfig.find(params[:id])
    #@metricconfigs = @metrics.metric_configs.paginate(page: params[:page])
    @dateToShow = '2014-09-15 00:00:00'
    @user = User.find(params[:id])
    @metricconfigs = @user.metric_configs.paginate(page: params[:page])
    @metrics = @user.metrics
    @metricsToShow = @metrics.where(metricdate: @dateToShow)
    #User.upsert_metric_fbdata
  end

  # GET /metrics/1
  def show
    #@metrics = MetricConfig.find(params[:id])
    #@metricconfigs = @metrics.metric_configs.paginate(page: params[:page])
    @dateToShow = '2014-09-15 00:00:00'
    #@user = User.find(params[:id])
    @metricconfigs = current_user.metric_configs.paginate(page: params[:page])
    @metrics = current_user.metrics
    @metricsToShow = @metrics.where(metricdate: @dateToShow)
    #User.upsert_metric_fbdata
  end

  # GET /metrics/new
  def new
    @metric = Metric.new
  end

  # GET /metrics/1/edit
  def edit
    @metric = Metric.find(params[:id])
  end

  # POST /metrics
  def create
    @metricconfig = MetricConfig.find(params[:metricconfig_id])
    @metric = @metricconfig.value.create(metric_params)
    redirect_to metricconfig_path(@metricconfig)
    #@metric = Metric.new(metric_params)

    #if @metric.save
    #  redirect_to @metric, notice: 'Metric was successfully created.'
    #else
    #  render action: 'new'
    #end
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
      params.require(:metric).permit(:value, :metricdate)
    end
end

class MetricConfigsController < ApplicationController
  before_action :set_metric_config, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  # GET /metric_configs
  def index
    @metric_configs = MetricConfig.paginate(page: params[:page])
    @dateToShow = '2014-09-15 00:00:00'
    #@user = User.find(params[:id])
    #render :text => current_user.name and return false
    @metricconfigs = current_user.metric_configs.paginate(page: params[:page])
    #@metrics = @user.metrics.paginate(page: params[:page])
    @metrics = current_user.metrics
    @metricsToShow = @metrics.where(metricdate: @dateToShow)
    #User.upsert_metric_fbdata
    #@metric_configs.find(updateable)
  end

  # GET /metric_configs/1
  def show
    @metric_configs = MetricConfig.find(params[:id])
  end

  # GET /metric_configs/new
  def new
    @metric_configs = MetricConfig.paginate(page: params[:page])
    @dateToShow = '2014-09-15 00:00:00'
    #@user = User.find(params[:id])
    #render :text => current_user.name and return false
    @metricconfigs = current_user.metric_configs.paginate(page: params[:page])
    #@metrics = @user.metrics.paginate(page: params[:page])
    @metrics = current_user.metrics
    @metricsToShow = @metrics.where(metricdate: @dateToShow)
    #User.upsert_metric_fbdata
    #@metric_configs.find(updateable)
  end

  # GET /metric_configs/1/edit
  def edit
    @metric_config = MetricConfig.find(params[:id])
  end

  def create
    @metric_config = current_user.metric_configs.build(metric_config_params)
   
    if @metric_config.save
      flash[:success] = "Metric Config created!"
      redirect_to root_url
    else
      #more work here - search railstutorial.org for feed_items
      @metric_config_items = []
      render 'static_pages/home'
    end
  end

  # PATCH/PUT /metric_configs/1
  # PATCH/PUT /metric_configs/1.json
  def update
    respond_to do |format|
      if @metric_config.update(metric_config_params)
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
    def metric_config_params
      #params.require(:user).permit(:value, :orderby, :profiledisplay, :updateable)
      params.require(:metric_config).permit(:user_id, :metricname, :orderby, :profiledisplay, :updateable, :metricdate, :metricconfig_id)
    end

    def correct_user
      @metric_config = current_user.metric_configs.find_by_id(params[:id])
      redirect_to root_path if @metric_config.nil?
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def metric_params
      params.require(:metric).permit(:value, :metricconfig_id)
    end
    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  end
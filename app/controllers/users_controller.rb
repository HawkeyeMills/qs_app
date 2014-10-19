class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :action]
  before_action :correct_user,   only: [:edit, :update, :action]
  before_action :admin_user,     only: :destroy

  require 'date_extensions'
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def action
   #cookies[:name]=params[:selected_value]
   render :text => "success"
  end 

  def show
    #Client.find_or_create_by(first_name: 'Andy')
    if(params.has_key?(:metricdate))
      logger.info ("----------------------------> #{params}")
      @dateToShow = params[:metricdate]
    else
      @dateToShow = Date.today
    end
    @user = User.find(params[:id])
    logger.info ("----------------------------> found user")
    #@metricconfigs = @user.metric_configs.paginate(page: params[:page])
    @metricconfigs = @user.metric_configs
    logger.info ("----------------------------> found metricconfigs")
    @metricsToShow = @user.metrics.where(metricdate: @dateToShow)
    logger.info ("----------------------------> found metricstoShow")
    #@metricsToShow = @user.metrics
    if(params.has_key?(:updateMetrics))
      User.refresh_metrics
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Quantified Self App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def generate_empty_daily_metrics
    @metricsToGen = @metrics.where(updateable: true)
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :metricdate)
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
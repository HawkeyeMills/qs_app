class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :action]
  before_action :correct_user,   only: [:edit, :update, :action]
  before_action :admin_user,     only: :destroy

  require 'date_extensions'
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def action
   render :text => "success"
  end 

  def show
    #Client.find_or_create_by(first_name: 'Andy')
    if(params.has_key?(:metricdate))
      @dateToShow = params[:metricdate]
    else
      @dateToShow = Date.today
    end
    @user = User.find(params[:id])
    @metricconfigs = @user.metric_configs
    @metricsToShow = @user.metrics.where(metricdate: @dateToShow)
    if(params.has_key?(:updateMetrics))
      User.refresh_metrics
    end
    if(params.has_key?(:calcgrades))
        @gradeconfigs = GradeConfig.all
        @gradecalcs = GradeCalc.all
        @metricsToShow.each do |metric|
          mv = metric.value
          mid = metric.id
          #logger.info("metric.metric_config_id = #{metric.metric_config_id}")
          objMC = @metricconfigs.find(metric.metric_config_id).id
          #logger.info ("objMC ----------------------------> #{metric.metric_config_id}")
          #gcid = GradeConfig.all.find(metric.metric_config_id)
          #logger.info ("gcid ----------------------------> #{gcid}")
          
          grade_config_id = @gradeconfigs.where(metric_config_id: metric.metric_config_id).pluck(:grade_calc_id)
          
          #logger.info ("grade_config_id ----------------------------> #{grade_config_id}")
          #@objGC = @metricconfigs.find(gradeconfig.metric_config_id).grade_calc_id
          if grade_config_id.count > 0
            grade_config_id.each do |gcid|
              calc = @gradecalcs.find(gcid).gradecalc

              logger.info (" -------------------------->Calc for #{objMC} =  #{calc}" )
              logger.info (" -------------------------->metric.metric_config_id =  #{metric.metric_config_id}" )
              logger.info (" -------------------------->mid =  #{mid}" )
              logger.info (" -------------------------->gcid =  #{gcid}" )

              if calc == 'standard'
                MetricGrade.calcStandard(metric.metric_config_id, mid, gcid, @metricsToShow)
              elsif calc == 'weight'
                MetricGrade.calcWeight(metric.metric_config_id, mid, gcid, @metricsToShow, @users)
              elsif calc == 'dbtc'
                #Standard works for DBTC calcs also
                MetricGrade.calcStandard(metric.metric_config_id, mid, gcid, @metricsToShow)
              elsif calc == 'declining'
                MetricGrade.calcDeclining(metric.metric_config_id, mid, gcid, @metricsToShow)
              elsif calc == 'time'
                MetricGrade.calcStandard(metric.metric_config_id, mid, gcid, @metricsToShow)
              end
            end
          end 
        end
        DailyGrade.calculate(@dateToShow, @metricsToShow)
        @grade = DailyGrade.getGrade(@dateToShow)
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
class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    #Client.find_or_create_by(first_name: 'Andy')
    @dateToShow = Date.today
    @user = User.find(params[:id])
    @metricconfigs = @user.metric_configs.paginate(page: params[:page])
    @metrics = @user.metrics
    @metricsToShow = @metrics.where(metricdate: @dateToShow)
    if(params.has_key?(:updateMetrics))
      refresh_metrics
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
    logger.info ("----------------------------> #{@metricsToGen}")
  end

  def refresh_metrics
    @startDate = Date.today
    @endDate = (Date.today - 2)

    @fbdata = Fitbitclient::Fitbitclient.new
    @fbdata.upsert_metric_data(@startDate, @endDate, "/body/weight")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/activities/tracker/steps")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/activities/tracker/distance")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/activities/log/activityCalories")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/activities/caloriesBMR")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/activities/calories")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/foods/log/caloriesIn")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/foods/log/water")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/activities/log/minutesSedentary")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/activities/log/minutesLightlyActive")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/activities/log/minutesFairlyActive")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/activities/log/minutesVeryActive")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/sleep/timeInBed")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/sleep/minutesAwake")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/sleep/minutesAsleep")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/sleep/awakeningsCount")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/sleep/efficiency")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/sleep/minutesToFallAsleep")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/sleep/minutesAfterWakeup")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/body/weight")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/body/bmi")
    @fbdata.upsert_metric_data(@startDate, @endDate, "/body/fat")
    @fbdata.upsert_heart_data(@startDate)
    @fbdata.upsert_blood_pressure_data(@startDate)
    @fbdata.upsert_food_data(@startDate)

    generate_empty_daily_metrics
    #MORE EXAMPLES
    #@fbdata = Fitbitclient::Fitbitclient.new
    #@activities = @fbdata.getActivityData
    #@userInfo = @fbdata.getUserData
    #@measurements = @fbdata.getMeasurementData
    #@user = User.find(params[:id])
    #show
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, 
                                    :password_confirmation)
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
class User < ActiveRecord::Base
  has_many :metric_configs, dependent: :destroy
  has_many :metrics, through: :metric_configs
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def User.upsert_metric_fbdata
    @fbdata = Fitbitclient::Fitbitclient.new
    #@startDate = "2014-01-01"
    #@endDate = "2014-09-18"
    @startDate = "2014-09-26"
    @endDate = "2014-09-26"
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
 end
  
#MORE EXAMPLES
    #@fbdata = Fitbitclient::Fitbitclient.new
    #@activities = @fbdata.getActivityData
    #@userInfo = @fbdata.getUserData
    #@measurements = @fbdata.getMeasurementData

  private
    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end


namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_metricconfigs
  end
end

def make_users
  admin = User.create!(name: "Brandon Mills",
                      email: "brandontmills@gmail.com",
                       password: "foobar",
                       password_confirmation: "foobar")
  admin.toggle!(:admin)
end

def make_metricconfigs
  users = User.all(limit: 6)
    users.each { |user| user.metric_configs.create!(metricname: "Steps", fbvalue: 'activities-tracker-steps', orderby: 1, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Distance", fbvalue: 'activities-tracker-distance', orderby: 2, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Activity Calories Burnt", fbvalue: 'activities-log-activityCalories', orderby: 50, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Calories BMR", fbvalue: 'activities-caloriesBMR', orderby: 51, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Total Calories Burnt", fbvalue: 'activities-calories', orderby: 52, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Calories In", fbvalue: 'foods-log-caloriesIn', orderby: 3, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Minutes Sedentary", fbvalue: 'activities-log-minutesSedentary', profiledisplay: 0) }
    users.each { |user| user.metric_configs.create!(metricname: "Minutes Lightly Active", fbvalue: 'activities-log-minutesLightlyActive', profiledisplay: 0) }
    users.each { |user| user.metric_configs.create!(metricname: "Minutes Fairly Active", fbvalue: 'activities-log-minutesFairlyActive', profiledisplay: 0) }
    users.each { |user| user.metric_configs.create!(metricname: "Minutes Very Active", fbvalue: 'activities-log-minutesVeryActive', orderby: 4, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Time In Bed", fbvalue: 'sleep-timeInBed', orderby: 40, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Minutes Asleep", fbvalue: 'sleep-minutesAsleep', orderby: 41, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Minutes Awake", fbvalue: 'sleep-minutesAwake', orderby: 42, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Awakenings Count", fbvalue: 'sleep-awakeningsCount', orderby: 43, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Efficiency", fbvalue: 'sleep-efficiency', orderby: 44, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Minutes To Fall Asleep", fbvalue: 'sleep-minutesToFallAsleep', orderby: 45, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Minutes After Wakeup", fbvalue: 'sleep-minutesAfterWakeup', profiledisplay: 0) }
    users.each { |user| user.metric_configs.create!(metricname: "Weight", fbvalue: "body-weight", orderby: 5) }
    users.each { |user| user.metric_configs.create!(metricname: "BMI", fbvalue: "body-bmi", profiledisplay: 0) }
    users.each { |user| user.metric_configs.create!(metricname: "Body Fat", fbvalue: "body-fat", orderby: 6, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Water", fbvalue: 'foods-log-water', orderby: 60, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Carbs", fbvalue: '', orderby: 61, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Fat", fbvalue: '', orderby: 62, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Protein", fbvalue: '', orderby: 63, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Fiber", fbvalue: '', orderby: 64, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Sodium", fbvalue: '', orderby: 65, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Systolic", fbvalue: '', orderby: 70, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Diastolic", fbvalue: '', orderby: 71, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "RHR", fbvalue: '', orderby: 73, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Workout Duration", fbvalue: '', orderby: 53, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Workout Rate", updateable: '1', orderby: 54, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "Push Ups", updateable: '1', orderby: 55, profiledisplay: 1) }
    users.each { |user| user.metric_configs.create!(metricname: "DBTC No Alcohol", updateable: '1', orderby: 80, profiledisplay: 1, metrictype: "boolean") }
    users.each { |user| user.metric_configs.create!(metricname: "DBTC No Late Calories", updateable: '1', orderby: 81, profiledisplay: 1, metrictype: "boolean") }
    users.each { |user| user.metric_configs.create!(metricname: "DBTC Write Motivations", updateable: '1', orderby: 82, profiledisplay: 1, metrictype: "boolean") }
    users.each { |user| user.metric_configs.create!(metricname: "DBTC Workout", updateable: '1', orderby: 83, profiledisplay: 1, metrictype: "boolean") }
    users.each { |user| user.metric_configs.create!(metricname: "DBTC No Java House", updateable: '1', orderby: 84, profiledisplay: 1, metrictype: "boolean") }
    users.each { |user| user.metric_configs.create!(metricname: "Daily Notes", updateable: '1', orderby: 100, profiledisplay: 1, metrictype: "boolean") }
end
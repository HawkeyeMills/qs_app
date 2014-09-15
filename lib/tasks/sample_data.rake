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
=begin    
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
     end
=end

   end

def make_metricconfigs
  users = User.all(limit: 6)
  #50.times do
      users.each { |user| user.metric_configs.create!(metricname: "Steps", fbvalue: 'activities-tracker-steps', orderby: 1) }
      users.each { |user| user.metric_configs.create!(metricname: "Distance", fbvalue: 'activities-tracker-distance', orderby: 2) }
      users.each { |user| user.metric_configs.create!(metricname: "Activity Calories Burnt", fbvalue: 'activities-log-activityCalories', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Calories BMR", fbvalue: 'activities-caloriesBMR', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Total Calories Burnt", fbvalue: 'activities-calories', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Calories In", fbvalue: 'foods-log-caloriesIn', orderby: 3) }
      users.each { |user| user.metric_configs.create!(metricname: "Minutes Sedentary", fbvalue: 'activities-log-minutesSedentary', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Minutes Lightly Active", fbvalue: 'activities-log-minutesLightlyActive', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Minutes Fairly Active", fbvalue: 'activities-log-minutesFairlyActive', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Minutes Very Active", fbvalue: 'activities-log-minutesVeryActive', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Time In Bed", fbvalue: 'sleep-timeInBed', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Minutes Asleep", fbvalue: 'sleep-minutesAsleep', orderby: 4) }
      users.each { |user| user.metric_configs.create!(metricname: "Minutes Awake", fbvalue: 'sleep-minutesAwake', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Awakenings Count", fbvalue: 'sleep-awakeningsCount', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Efficiency", fbvalue: 'sleep-efficiency', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Minutes To Fall Asleep", fbvalue: 'sleep-minutesToFallAsleep', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Minutes After Wakeup", fbvalue: 'sleep-minutesAfterWakeup', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Weight", fbvalue: "body-weight", orderby: 5) }
      users.each { |user| user.metric_configs.create!(metricname: "BMI", fbvalue: "body-bmi", orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Body Fat", fbvalue: "body-fat", orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Water", fbvalue: 'foods-log-water', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Carbs", fbvalue: '', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Fat", fbvalue: '', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Protein", fbvalue: '', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Fiber", fbvalue: '', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Sodium", fbvalue: '', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Systolic", fbvalue: '', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Diastolic", fbvalue: '', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "RHR", fbvalue: '', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Workout Duration", fbvalue: '', orderby: 20) }
      users.each { |user| user.metric_configs.create!(metricname: "Workout Rate", updateable: '1') }
      users.each { |user| user.metric_configs.create!(metricname: "Push Ups", updateable: '1') }
      users.each { |user| user.metric_configs.create!(metricname: "DBTC No Alcohol", updateable: '1') }
      users.each { |user| user.metric_configs.create!(metricname: "DBTC No Late Calories", updateable: '1') }
      users.each { |user| user.metric_configs.create!(metricname: "DBTC Write Motivations", updateable: '1') }
      users.each { |user| user.metric_configs.create!(metricname: "DBTC Workout", updateable: '1') }
      users.each { |user| user.metric_configs.create!(metricname: "DBTC No Java House", updateable: '1') }
    #end
  #end
end
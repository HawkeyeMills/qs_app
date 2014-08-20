namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Brandon Mills",
                         email: "brandontmills@gmail.com",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
    #99.times do |n|
    #  name  = Faker::Name.name
    #  email = "example-#{n+1}@railstutorial.org"
    #  password  = "password"
    #  User.create!(name: name,
    #               email: email,
    #               password: password,
    #               password_confirmation: password)
    #end
    users = User.all(limit: 6)
    #50.times do
      users.each { |user| user.metric_configs.create!(value: "Steps", orderby: 1) }
      users.each { |user| user.metric_configs.create!(value: "Distance", orderby: 2) }
      users.each { |user| user.metric_configs.create!(value: "Activity Calories Burnt") }
      users.each { |user| user.metric_configs.create!(value: "Calories BMR") }
      users.each { |user| user.metric_configs.create!(value: "Total Calories Burnt") }
      users.each { |user| user.metric_configs.create!(value: "Calories In") }
      users.each { |user| user.metric_configs.create!(value: "Minutes Sedentary") }
      users.each { |user| user.metric_configs.create!(value: "Minutes Lightly Active") }
      users.each { |user| user.metric_configs.create!(value: "Minutes Fairly Active") }
      users.each { |user| user.metric_configs.create!(value: "Minutes Very Active") }
      users.each { |user| user.metric_configs.create!(value: "Time In Bed") }
      users.each { |user| user.metric_configs.create!(value: "Minutes Asleep") }
      users.each { |user| user.metric_configs.create!(value: "Minutes Awake") }
      users.each { |user| user.metric_configs.create!(value: "Awakenings Count") }
      users.each { |user| user.metric_configs.create!(value: "Efficiency") }
      users.each { |user| user.metric_configs.create!(value: "Minutes To Fall Asleep") }
      users.each { |user| user.metric_configs.create!(value: "Minutes After Wakeup") }
      users.each { |user| user.metric_configs.create!(value: "Weight") }
      users.each { |user| user.metric_configs.create!(value: "BMI") }
      users.each { |user| user.metric_configs.create!(value: "Body Fat") }
      users.each { |user| user.metric_configs.create!(value: "Water") }
      users.each { |user| user.metric_configs.create!(value: "Carbs") }
      users.each { |user| user.metric_configs.create!(value: "Fat") }
      users.each { |user| user.metric_configs.create!(value: "Protein") }
      users.each { |user| user.metric_configs.create!(value: "Fiber") }
      users.each { |user| user.metric_configs.create!(value: "Sodium") }
      users.each { |user| user.metric_configs.create!(value: "Systolic") }
      users.each { |user| user.metric_configs.create!(value: "Diastolic") }
      users.each { |user| user.metric_configs.create!(value: "RHR") }
      users.each { |user| user.metric_configs.create!(value: "Workout Duration") }
      users.each { |user| user.metric_configs.create!(value: "Workout Rate") }
      users.each { |user| user.metric_configs.create!(value: "Push Ups") }
      users.each { |user| user.metric_configs.create!(value: "DBTC No Alcohol") }
      users.each { |user| user.metric_configs.create!(value: "DBTC No Late Calories") }
      users.each { |user| user.metric_configs.create!(value: "DBTC Write Motivations") }
      users.each { |user| user.metric_configs.create!(value: "DBTC Workout") }
      users.each { |user| user.metric_configs.create!(value: "DBTC No Java House") }
    #end
  end
end
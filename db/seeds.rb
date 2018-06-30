User.create!(name:                  "Example User",
             email:                 "example@chordle.com",
             password:              "testtesttest",
             password_confirmation: "testtesttest",
             admin:                 true)

99.times do |n|
    name     = Faker::Name.name
    email    = "example-#{ n + 1 }@chordle.com"
    password = "testtesttest"

    User.create!(name:                  name,
                 email:                 email,
                 password:              password,
                 password_confirmation: password)
end

users = User.order(:created_at).take(5)
50.times do
   description      = Faker::Lorem.sentence(1)
   priority         = ['High', 'Medium', 'Low'].sample
   time_to_complete = [10, 15, 20, 25, 30, 45, 60, 120].sample 

   users.each { |user| user.chores.create!(description: description, priority: priority, time_to_complete: time_to_complete) }
end
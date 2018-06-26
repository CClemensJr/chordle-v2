User.create!(name:                  "Example User",
             email:                 "example@chordle.com",
             password:              "testtesttest",
             password_confirmation: "testtesttest")

99.times do |n|
    name     = Faker::Name.name
    email    = "example-#{ n + 1 }@chordle.com"
    password = "testtesttest"

    User.create!(name:                  name,
                 email:                 email,
                 password:              password,
                 password_confirmation: password)
end

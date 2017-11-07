# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Create Admin Users

User.create!(first_name: "Jason", last_name: "Doggart", email: "jasondoggart@gmail.com", password: "password", password_confirmation: "password", admin: true)
User.create!(first_name: "Jeremy", last_name: "Bates", email: "jbates@gtburlington.org", password: "password", password_confirmation: "password", admin: true)
User.create!(first_name: "Kevin", last_name: "Shepherd", email: "kshepherd@gtburlington.org", password: "password", password_confirmation: "password", admin: true)
User.create!(first_name: "Thomas", last_name: "Hamilton", email: "thomasjbhamilton@gmail.com", password: "password", password_confirmation: "password", admin: true)


# Create 100 regular users
i = 1
100.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "user#{i}@example.com"
  street_address = Faker::Address.street_address
  city = Faker::Address.city
  province = "Ontario"
  admin = false
  cellphone = "5555555555"
  User.create!(first_name: first_name, last_name: last_name, email: email, street_address: street_address, city: city, province: province, password: "password", password_confirmation: "password", admin: admin, cellphone: cellphone)
  i += 1
end

# Create Ministries

name = "The Fuse"
description = "FUSE SR. HIGH is a Youth Ministry for High school grades 9 - 12. Fridays at 7:30pm, 1401 Guelph Line. We are teens that are living for God and living for each other."
ministry = Ministry.create!(name: name, description: description)
user = User.create!(first_name: "Rick", last_name: "Zuidersma", email: "rzuidersma@gtburlington.org", password: "password", password_confirmation: "password")
MinistryEditor.create!(ministry: ministry, user: user)

name = "Flipside"
description = "We believe that God wants to be involved in every season of your life, including this one! God has so much in store for you…are you ready? Come out to Flipside and see for yourself!"
ministry = Ministry.create!(name: name, description: description)
user = User.create!(first_name: "Holly", last_name: "Bates", email: "hbates@gtburlington.org", password: "password", password_confirmation: "password")
MinistryEditor.create!(ministry: ministry, user: user)

name = "Lift Kids"
description = "LIFT is our Family Life Ministry. Partnering with parents as the primary spiritual care givers in their kids' lives, our goal is help develop spiritually strong children and families."
ministry = Ministry.create!(name: name, description: description)
user = User.create!(first_name: "Jenni", last_name: "Colwell", email: "jcolwell@gtburlington.org", password: "password", password_confirmation: "password")
MinistryEditor.create!(ministry: ministry, user: user)

name = "GT YA"
description = "We love to see young adults encounter God, discovering purpose and the abundant life they can have in Christ."
ministry = Ministry.create!(name: name, description: description)
user = User.create!(first_name: "Steve", last_name: "Swartwood", email: "sswartwood@gtburlington.org", password: "password", password_confirmation: "password")
MinistryEditor.create!(ministry: ministry, user: user)

name = "Seniors"
description = "If you are looking for fun and fellowship with people who share your life experience, we have a ministry for you. Our seniors are a highly valued part of the GT church family, and continue to be actively involved in church ministry in many ways."
ministry = Ministry.create!(name: name, description: description)
user = User.create!(first_name: "Salem", last_name: "Faraj", email: "sfaraj@gtburlington.org", password: "password", password_confirmation: "password")
MinistryEditor.create!(ministry: ministry, user: user)

#Create events for each ministry
nums = [5,6,7,8,9,10]
ministries = Ministry.all
ministries.each do |ministry|
  z = 1
  num_events = nums[rand(nums.length)]
  num_events.times do
    days = 5 * z
    name = "Event #{z} for #{ministry.name}"
    description = "Description for Event #{1}"
    start_time = days.days.from_now
    end_time = start_time + 3.hours
    z += 1
    ministry.events.create!(name: name, description: description, start_time: start_time, end_time: end_time)
  end
end

#Create announcements for each ministry

nums = [5,6,7,8,9,10]
user = User.find_by(id: 1)
ministries.each do |ministry|
  num_announcements = nums[rand(nums.length)]
  y = 1
  num_announcements.times do
    subject = "Announcement #{y} for #{ministry.name}"
    text = "The text for announcement #{y} for #{ministry.name}"
    ministry.announcements.create!(subject: subject, text: text, user: user)
    y += 1
  end
end

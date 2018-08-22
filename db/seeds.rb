puts "Generating my user"
u = User.find_or_create_by(username: "objo")
u.update_attributes({
  first_name: "Joe",
  last_name: "O'Brien",
  city:      "Westerville",
  state:     "OH",
  bio:        "Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas faucibus mollis interdum. Vestibulum id ligula porta felis euismod semper. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Nulla vitae elit libero, a pharetra augue.",
  fake:        false,
  email:        "joe@mo.com",
  password:     "123456",
  password_confirmation: "123456",

})
u.save!

puts "Deleting fake users"
User.where(fake: true).destroy_all

puts "Generate fake users"
10.times do
  putc "."
 User.create!({
   username:    Faker::Internet.username,
   first_name:  Faker::Name.first_name,
   last_name:   Faker::Name.last_name,
   city:        Faker::Address.city,
   state:       Faker::Address.state_abbr,
   bio:         Faker::Lorem.paragraph,
   fake:        true,
   email:       Faker::Internet.email,
   password:    "123456",
   password_confirmation: "123456",
   })

end

puts "Done"


puts "Generating my user"
u = User.find_or_create_by(username: "objo")
u.update_attributes({
  first_name: "Joe",
  last_name:  "O'Brien",
  city:       "Westerville",
  state:      "OH",
  bio:        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  fake:       false,
  email:      "joe@no.com",
  password:   "123456",
  password_confirmation: "123456",
})
u.save!

puts "Deleting fake users"
User.where(fake: true).destroy_all

puts "Generating fake users\n"
10.times do
  putc "."
  User.create!({
    username:   Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    city:       Faker::Address.city,
    state:      Faker::Address.state_abbr,
    bio:        Faker::Lorem.paragraph,
    fake:       true,
    email:      Faker::Internet.email,
    password:   "123456",
    password_confirmation: "123456",
  })
end

puts "done"
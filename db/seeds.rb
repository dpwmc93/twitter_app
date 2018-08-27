
def create_messages(user)
  puts "Creating messages for #{user.full_name}"
  20.times {
    putc "."
    user.messages.create!({
      body: Faker::ChuckNorris.fact,
      created_at: Faker::Date.between(2.weeks.ago, Time.now),

      })
  }
  user.save
  puts "Done"
end

Message.destroy_all

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
create_messages(u)


puts "Deleting fake users"
User.where(fake: true).destroy_all


puts "Generate fake users"
10.times do

 u = User.new({
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
   u.save!
   create_messages(u)

end

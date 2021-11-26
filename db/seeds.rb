# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "creating test user"

User.create!(email: "test@test.fr", password: 123456, username: "test", admin: false)

puts "creating admin user"

User.create!(email: "admin@admin.fr", password: 123456, username: "admin", admin: true)

puts "creating test and admin dashboards"

Dashboard.create!(user_id: 1)
Dashboard.create!(user_id: 2)

puts "seeding Messari ..."

MessariApi.create!.top_graph("Bitcoin", "2020-01-01", "2020-01-07")


# <%= area_chart Visit.group_by_minute(:created_at).maximum(:load_time) %>

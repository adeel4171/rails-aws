# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
	@user = User.create!(name: Faker::Name.name , email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678")
	@user.posts.create!(title: Faker::Company.name, body: Faker::Demographic.educational_attainment)
	@user.posts.last.comments.create(message: Faker::Demographic.educational_attainment)
end
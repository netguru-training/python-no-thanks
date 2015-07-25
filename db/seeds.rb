# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

user1 = User.create!(email: "jan.kowalski@gmail.com", password: "12345678", password_confirmation: "12345678", name: "Jan Kowalski" )


gallery1 = Gallery.new(user: user1, title: "Wakacje 2015", description: "2 tyg. wyjazd na mazury")

image1 = Image.new(user: user1, gallery: gallery1, picture: File.new("#{Rails.root}/app/assets/images/sample3.jpg"), title: "sunflower", description:"a beautyfull flower")

gallery1.save
image1.save
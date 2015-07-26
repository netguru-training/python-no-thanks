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

(1..10).each do |i|
  gal = Gallery.new(title: "Test", description: "opis", user: user1)
  im = Image.new(user: user1, :title => "test1", :description => "test2", :gallery => gal, :picture => File.new("#{Rails.root}/app/assets/images/sample_images/im" + i.to_s + ".jpg"))
  gal.images << im
  gal.save!
end

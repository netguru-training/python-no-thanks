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

(1..7).each do |i|
  gal = Gallery.new(title: "Testowa galeria #{i.to_s}", 
    description: "Vestibulum pretium congue neque, vitae euismod felis fringilla sed. Sed maximus, neque eget pretium pellentesque, massa odio malesuada orci, quis imperdiet metus nibh nec erat. Aenean molestie eros sed tempor ultricies. Ut diam sapien, viverra nec mauris vitae, vestibulum efficitur dolor. Nullam nec vestibulum diam.", 
    user: user1)
  im = Image.new(user: user1, 
    :title => "Testowy tytuł #{i.to_s}", 
    :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin consequat magna a libero rutrum, ac viverra ante ultricies. Suspendisse rutrum dolor fermentum enim congue dapibus. Morbi finibus, orci sed tempus venenatis, eros nibh finibus arcu, in rhoncus purus nulla vel arcu.", 
    :gallery => gal,
    :picture => File.new("#{Rails.root}/app/assets/images/sample_images/im" + i.to_s + ".jpg"))
  if i%2 == 0
    im.tag_list.add(:funny)
  else
    im.tag_list.add(:sad)
  end
  if i%3 == 0
    im.tag_list.add(:rare)
  else
    im.tag_list.add(:common)
  end
  gal.images << im
  gal.save!
end

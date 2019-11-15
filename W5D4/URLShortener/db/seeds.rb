# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ActiveRecord::Base.transaction do
  User.destroy_all
  ShortenedUrl.destroy_all


  users = []
  jennifer = User.create!(email: 'jenken@gmail.com')
  users << jennifer

  andy = User.create!(email: 'andy@gmail.com.au')
  users << andy
  
  mike = User.create!(email: 'cheesecurds@gmail.com')
  users << mike

  walker = User.create!(email: 'texas_ranger@gmail.com')
  users << walker

  ronil = User.create!(email: 'ddron@gmail.com')
  users << ronil

  helen = User.create(email: 'karaoke@gmail.com')
  users << helen
  
  michelle = User.create!(email: 'tree_times_gdp@gmail.com')
  users << michelle
  
  vanessa = User.create!(email: 'van_ness@gmail.com')
  users << vanessa

  carlos = User.create(email: 'cant_ride_a_bike@gmail.com')
  users << carlos
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(:email => 'admin1@admin', :password => 'qwerty', :password_confirmation => 'qwerty')
Admin.create(:email => 'admin2@admin', :password => 'qwerty', :password_confirmation => 'qwerty')
Admin.create(:email => 'admin3@admin', :password => 'qwerty', :password_confirmation => 'qwerty')

User.create(:email => 'user1@User', :password => 'qwerty', :password_confirmation => 'qwerty')
User.create(:email => 'user2@User', :password => 'qwerty', :password_confirmation => 'qwerty')
User.create(:email => 'user3@User', :password => 'qwerty', :password_confirmation => 'qwerty')
User.create(:email => 'user4@User', :password => 'qwerty', :password_confirmation => 'qwerty')
User.create(:email => 'user5@User', :password => 'qwerty', :password_confirmation => 'qwerty')

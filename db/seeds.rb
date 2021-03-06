# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'admin@admin', password: 'NotAdmin', password_confirmation: 'NotAdmin')

User.create (1..4).inject([]) { |command, n| command << {
  email: "user#{n}@user", password: 'qwerty', password_confirmation: 'qwerty'
}; command }

Task.create!([
  { title: 'Dog goes', body: 'woof', user_id: 1 },
  { title: 'Cat goes', body: 'meow', user_id: 2 },
  { title: 'Bird goes', body: 'tweet', user_id: 4 },
  { title: 'Mouse goes', body: 'squeek', user_id: 3 }
])

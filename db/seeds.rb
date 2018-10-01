# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = [
  {
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password',
    first_name: 'Admin',
    last_name: 'Admin',
    admin: true
  },
  {
    email: 'jedi@example.com',
    password: 'password',
    password_confirmation: 'password',
    first_name: 'Dental',
    last_name: 'Jedi'
  },
]

users.each do |user|
  User.find_or_initialize_by(email: user[:email]).update!(user)
end

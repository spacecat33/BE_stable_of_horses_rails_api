# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Stable.destroy_all
Horse.destroy_all

5.times do
    u = Stable.create(name: Faker::Name.name, location: Faker::Address.full_address)
    u.horses.create(name: Faker::Creature::Horse.name) 
end
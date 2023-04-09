# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Stable.destroy_all
# Horse.destroy_all
# Stable.destroy_all

# 15.times do
#     u = Stable.create(name: Faker::Name.name)
#     u.horses.create(name: Faker::Creature::Horse.name) 
# end

# Horse.destroy_all
# Stable.destroy_all
stable_1 = Stable.create(name: "Top Stable")
stable_2 = Stable.create(name: "Pony Farm")
stable_3 = Stable.create(name: "Donkey Sanctuary")

Horse.create([
    {name: "Horse", stable: stable_1},
    {name: "Pony", stable: stable_2},
    {name: "donkey", stable: stable_3}
])
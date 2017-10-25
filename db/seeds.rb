# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat1 = Cat.create(:name => 'Cat', :birth_date => Date.new(2002, 3, 1), :color => 'Black', :sex => 'M', description: "s;dlfjsldfjk")
cat2 = Cat.create(:name => 'Cat2', :birth_date => Date.new(2005, 7, 2), :color => 'White', :sex => 'M', description: "s;dlfjsldfjk")

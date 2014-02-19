# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

State.create([{name: 'NY'}, {name: 'CA'}, {name: 'MA'}, {name: 'NH'}])

City.create([{name: 'New York', state_id: 1}, {name: 'San Francisco', state_id: 2}, {name: 'Boston', state_id: 3}, {name: 'Manchester', state_id: 4}])

Category.create([
  {name: 'American (new)'},
  {name: 'Asian Fusion'},
  {name: 'Bars'},
  {name: 'Chinese'},
  {name: 'Coffee'},
  {name: 'Dessert'},
  {name: 'French'},
  {name: 'Indian'},
  {name: 'Italian'},
  {name: 'Japanese'},
  {name: 'Korean'},
  {name: 'Mediterranean'},
  {name: 'Seafood'},
  {name: 'Spanish'},
  {name: 'Thai'},
  {name: 'Vietnamese'}
  ])

User.create({username: 'ant', password: '123123', email: 'liangtfm@gmail.com', biography: "Hello!", age: 26, gender: "M", location: "NYC", admin: true})
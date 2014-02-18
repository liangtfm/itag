# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

State.create([{name: 'NY'}, {name: 'CA'}])

City.create([{name: 'New York', state_id: 1}, {name: 'San Francisco', state_id: 2}])

Category.create([{name: 'Italian'}, {name: 'French'}, {name: 'American'}, {name: 'Asian Fusion'}, {name: 'Chinese'}, {name: 'Japanese'}, {name: 'Korean'}, {name: 'Bars'}, {name: 'Coffee'}, {name: 'Indian'}, {name: 'Thai'}, {name: 'Seafood'}])

User.create({username: 'ant', password: '123123', email: 'liangtfm@gmail.com', admin: true})
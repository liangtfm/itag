# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

State.create([
  {name: 'NY'}, #1
  {name: 'CA'}, #2
  {name: 'MA'}, #3
  {name: 'NH'}  #4
  ])

City.create([
  {name: 'New York', state_id: 1},
  {name: 'San Francisco', state_id: 2},
  {name: 'Boston', state_id: 3},
  {name: 'Manchester', state_id: 4}
  ])

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

Restaurant.create([
  {name: "Curry-Ya",
    website: "http://nycurry-ya.com",
    price: "$$",
    phone: "(212) 995-2877",
    street: "214 E 10th St",
    city_id: 1,
    zip: "",
    open: true,
    category_ids: [10]
  },
  {name: "Totto Ramen",
    website: "http://tottoramen.com",
    price: "$$",
    phone: "(212) 582-0052",
    street: "366 W 52nd St",
    city_id: 1,
    zip: "10028",
    open: true,
    category_ids: [10]
  },
  {name: "Minca",
    website: "http://newyorkramen.com",
    price: "$$",
    phone: "(212) 505-8001",
    street: "536 E 5th St",
    city_id: 1,
    zip: "10009",
    open: true,
    category_ids: [10]
  },
  {name: "Sakagura",
    website: "",
    price: "$$$",
    phone: "",
    street: "309 E 83rd St",
    city_id: 1,
    zip: "",
    open: true,
    category_ids: [10]
  },
  {name: "Village Yokocho",
    website: "",
    price: "$$",
    phone: "",
    street: "8 Stuyvesant St",
    city_id: 1,
    zip: "",
    open: true,
    category_ids: [10]
  },
  {name: "Cocoron",
    website: "",
    price: "$$",
    phone: "",
    street: "61 Delancey St",
    city_id: 1,
    zip: "",
    open: true,
    category_ids: [10]
  },
  {name: "Kyo Ya",
    website: "",
    price: "$$$$",
    phone: "",
    street: "94 E 7th St",
    city_id: 1,
    zip: "",
    open: true,
    category_ids: [10]
  },
  {name: "Ootoya",
    website: "",
    price: "$$",
    phone: "",
    street: "8 W 18th St",
    city_id: 1,
    zip: "",
    open: true,
    category_ids: [10]
  },
  {name: "Takashi",
    website: "",
    price: "$$$",
    phone: "(212) 737-5656",
    street: "456 Hudson St",
    city_id: 1,
    zip: "",
    open: true,
    category_ids: [10]
  },
  {name: "Hakata Tonton",
    website: "",
    price: "$$",
    phone: "(212) 737-5656",
    street: "61 Grove St",
    city_id: 1,
    zip: "",
    open: true,
    category_ids: [10]
  },
  {name: "Sushi Nakazawa",
    website: "",
    price: "$$$$",
    phone: "(212) 737-5656",
    street: "23 Commerce St",
    city_id: 1,
    zip: "",
    open: true,
    category_ids: [10]
  },
])

User.create({username: 'ant', password: '123123', email: 'liangtfm@gmail.com', biography: "Hello!", age: 26, gender: "M", location: "NYC", admin: true})


100.times do
  Restaurant.create({
    name: Faker::Company.name,
    website: "http://"+Faker::Internet.domain_name,
    price: ["$","$$","$$$","$$$$"].sample,
    phone: Faker::PhoneNumber.phone_number,
    street: Faker::Address.street_address,
    city_id: rand(1..4),
    zip: Faker::Address.zip_code,
    open: true,
    category_ids: rand(1..16)
  })
end

50.times do
  User.create({
    username: Faker::Internet.user_name + rand(1..1000).to_s,
    password: '123123',
    email: Faker::Internet.user_name + rand(1..1000).to_s + Faker::Internet.email,
    biography: Faker::Lorem.paragraph,
    age: rand(18..50),
    gender: ["M","F"].sample,
    location: ["NYC", "NY", "SF", "Boston", "San Francisco", "Manchester, NH", "ManchVegas", "New York"].sample
  })
end


1000.times do
  Review.create({
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraphs.join(" "),
    rating: rand(1..5),
    user_id: rand(2..51),
    restaurant_id: rand(1..111)
  })
end
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
    open: true
  },
  {name: "Donguri Restaurant",
    website: "",
    price: "$$$",
    phone: "(212) 737-5656",
    street: "309 E 83rd St",
    city_id: 1,
    zip: "10028",
    open: true
  },
  {name: "Sushi Yasaka",
    website: "",
    price: "$$$",
    phone: "",
    street: "309 E 83rd St",
    city_id: 1,
    zip: "",
    open: true
  },
  {name: "Sakagura",
    website: "",
    price: "$$$",
    phone: "",
    street: "309 E 83rd St",
    city_id: 1,
    zip: "",
    open: true
  },
  {name: "MEW Izakaya",
    website: "",
    price: "$$$",
    phone: "",
    street: "309 E 83rd St",
    city_id: 1,
    zip: "",
    open: true
  },
  {name: "Cocoron",
    website: "",
    price: "$$",
    phone: "",
    street: "61 Delancey St",
    city_id: 1,
    zip: "",
    open: true
  },
  {name: "Kyo Ya",
    website: "",
    price: "$$$$",
    phone: "",
    street: "94 E 7th St",
    city_id: 1,
    zip: "",
    open: true
  },
  {name: "Ootoya",
    website: "",
    price: "$$",
    phone: "",
    street: "8 W 18th St",
    city_id: 1,
    zip: "",
    open: true
  },
  {name: "Takashi",
    website: "",
    price: "$$$",
    phone: "(212) 737-5656",
    street: "456 Hudson St",
    city_id: 1,
    zip: "",
    open: true
  },
  {name: "Hakata Tonton",
    website: "",
    price: "$$",
    phone: "(212) 737-5656",
    street: "61 Grove St",
    city_id: 1,
    zip: "",
    open: true
  },
  {name: "Zenkichi",
    website: "",
    price: "$$$",
    phone: "(212) 737-5656",
    street: "77 N 6th St",
    city_id: 1,
    zip: "",
    open: true
  },
])

User.create({username: 'ant', password: '123123', email: 'liangtfm@gmail.com', biography: "Hello!", age: 26, gender: "M", location: "NYC", admin: true})
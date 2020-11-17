# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

# USERS

puts "Re-creating Users ..."

User.destroy_all

user1 = User.create({
  first_name: 'Ricky',
  last_name: 'Bobby',
  email: 'excellence@test.com',
  password: 'password',
  password_confirmation: 'password'
})

user2 = User.create({
  first_name: 'Karen',
  last_name: 'Shmaren',
  email: 'yikes@test.com',
  password: 'password',
  password_confirmation: 'password'
})

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

prod1 = cat1.products.create({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

prod2 = cat1.products.create({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

prod3 = cat1.products.create({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
})

prod4 = cat1.products.create({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

prod5 = cat1.products.create({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

prod6 = cat1.products.create({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


prod7 = cat2.products.create({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

prod8 = cat2.products.create({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 0,
  price: 26.00
})

prod9 = cat2.products.create({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

prod10 = cat3.products.create({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

prod11 = cat3.products.create({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 0,
  price: 987.99
})

prod12 = cat3.products.create({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 23,
  price: 2_483.76
})

# SALES 

puts "Re-creating Sales ..."

Sale.destroy_all

sale1 = Sale.create({
  name: 'HOLIDAY SALE',
  percent_off: 35,
  starts_on: 'Dec 5, 2020',
  ends_on: 'Jan 3, 2021'
})

sale2 = Sale.create({
  name: 'Thanksgiving Sale',
  percent_off: 15,
  starts_on: 'Oct 5, 2020',
  ends_on: 'Oct 20, 2020'
})

sale3 = Sale.create({
  name: 'ABSOLUTE MADNESS SALE!!!',
  percent_off: 50,
  starts_on: 'Nov 10, 2020',
  ends_on: 'Nov 21, 2020'
})

# REVIEWS

puts "Re-creating Reviews ..."

Review.destroy_all

review1 = prod1.reviews.create({
  user_id: 1 
  description: "They're playing the piano while flying in the plane."
  rating: 4
})

review2 = prod1.reviews.create({
  user_id: 2
  description: "Someone I know recently combined Maple Syrup & buttered Popcorn thinking it would taste like caramel popcorn. It didn’t and they don’t recommend anyone else do it either."
  rating: 2
})

review3 = prod2.reviews.create({
  user_id: 1 
  description: "Iguanas were falling out of the trees."
  rating: 5
})

review4 = prod2.reviews.create({
  user_id: 2
  description: "Hit me with your pet shark!"
  rating: 1
})

review5 = prod3.reviews.create({
  user_id: 1 
  description: "Her hair was windswept as she rode in the black convertible."
  rating: 4
})

review6 = prod3.reviews.create({
  user_id: 2
  description: "He had accidentally hacked into his company's server."
  rating: 3
})

review7 = prod4.reviews.create({
  user_id: 1 
  description: "The complicated school homework left the parents trying to help their kids quite confused."
  rating: 4
})

review8 = prod4.reviews.create({
  user_id: 2
  description: "He uses onomatopoeia as a weapon of mental destruction."
  rating: 3
})

review9 = prod5.reviews.create({
  user_id: 1 
  description: "He had reached the point where he was paranoid about being paranoid."
  rating: 5
})

review10 = prod5.reviews.create({
  user_id: 2
  description: "If I don’t like something, I’ll stay away from it."
  rating: 2
})

review11 = prod6.reviews.create({
  user_id: 1 
  description: "There was no telling what thoughts would come from the machine."
  rating: 5
})

review12 = prod6.reviews.create({
  user_id: 2
  description: "Two more days and all his problems would be solved."
  rating: 4
})

review13 = prod7.reviews.create({
  user_id: 1 
  description: "They're playing the piano while flying in the plane."
  rating: 4
})

review14 = prod7.reviews.create({
  user_id: 2
  description: "Someone I know recently combined Maple Syrup & buttered Popcorn thinking it would taste like caramel popcorn. It didn’t and they don’t recommend anyone else do it either."
  rating: 3
})

review15 = prod8.reviews.create({
  user_id: 1 
  description: "Iguanas were falling out of the trees."
  rating: 3
})

review16 = prod8.reviews.create({
  user_id: 2
  description: "Hit me with your pet shark!"
  rating: 1
})

review17 = prod9.reviews.create({
  user_id: 1 
  description: "Her hair was windswept as she rode in the black convertible."
  rating: 4
})

review18 = prod9.reviews.create({
  user_id: 2
  description: "He had accidentally hacked into his company's server."
  rating: 4
})

review19 = prod10.reviews.create({
  user_id: 1 
  description: "The complicated school homework left the parents trying to help their kids quite confused."
  rating: 4
})

review20 = prod10.reviews.create({
  user_id: 2
  description: "He uses onomatopoeia as a weapon of mental destruction."
  rating: 3
})

review21 = prod11.reviews.create({
  user_id: 1 
  description: "He had reached the point where he was paranoid about being paranoid."
  rating: 5
})

review22 = prod11.reviews.create({
  user_id: 2
  description: "If I don’t like something, I’ll stay away from it."
  rating: 4
})

review23 = prod12.reviews.create({
  user_id: 1 
  description: "There was no telling what thoughts would come from the machine."
  rating: 5
})

review24 = prod12.reviews.create({
  user_id: 2
  description: "Two more days and all his problems would be solved."
  rating: 4
})

puts "DONE!"


require 'faker'

if Product.all.count == 0
  100.times do 
    Product.create!({
      name: Faker::Commerce.product_name,
      price: Faker::Commerce.price,
      stock: Random.rand(1000) + 1,
      description: Faker::Lorem.sentence(4, true, 5)
    })
  end
end
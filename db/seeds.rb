# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
safeway = Supermarket.create(name: 'Safeway', location: 'Arvada, CO')
ks = Supermarket.create(name: 'King Soopers', location: 'Denver, CO')
sprouts = Supermarket.create(name: 'Sprouts', location: 'Centennial, CO')

mike = Customer.create(name: 'Mike Dao', supermarket_id: sprouts.id)
dani = Customer.create(name: 'Dani Coleman', supermarket_id: safeway.id)
chris = Customer.create(name: 'Chris Simmons', supermarket_id: ks.id)
tyler = Customer.create(name: 'Tyler Caudill', supermarket_id: safeway.id)
gauri = Customer.create(name: 'Gauri Joshi', supermarket_id: sprouts.id)
lucas = Customer.create(name: 'Lucas Colwell', supermarket_id: ks.id)

bread = Item.create(name: 'Bread', price: 400)
milk = Item.create(name: 'Milk', price: 600)
apples = Item.create(name: 'Apples', price: 200)
candy= Item.create(name: 'Candy', price: 100)
bananas = Item.create(name: 'Bananas', price: 250)
avocado = Item.create(name: 'Avocado', price: 150)
meat = Item.create(name: 'Meat', price: 650)
cheese = Item.create(name: 'Cheese', price: 500)

CustomerItem.create(item_id: bread.id, customer_id: mike.id)
CustomerItem.create(item_id: milk.id, customer_id: mike.id)
CustomerItem.create(item_id: avocado.id, customer_id: mike.id)
CustomerItem.create(item_id: bread.id, customer_id: dani.id)
CustomerItem.create(item_id: cheese.id, customer_id: dani.id)
CustomerItem.create(item_id: meat.id, customer_id: dani.id)
CustomerItem.create(item_id: candy.id, customer_id: chris.id)
CustomerItem.create(item_id: bananas.id, customer_id: chris.id)
CustomerItem.create(item_id: milk.id, customer_id: chris.id)
CustomerItem.create(item_id: apples.id, customer_id: gauri.id)
CustomerItem.create(item_id: avocado.id, customer_id: gauri.id)
CustomerItem.create(item_id: bananas.id, customer_id: gauri.id)
CustomerItem.create(item_id: cheese.id, customer_id: tyler.id)
CustomerItem.create(item_id: candy.id, customer_id: tyler.id)
CustomerItem.create(item_id: milk.id, customer_id: tyler.id)
CustomerItem.create(item_id: meat.id, customer_id: lucas.id)
CustomerItem.create(item_id: bread.id, customer_id: lucas.id)
CustomerItem.create(item_id: apples.id, customer_id: lucas.id)

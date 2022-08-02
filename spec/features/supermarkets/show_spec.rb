require 'rails_helper'

RSpec.describe 'the supermarket show page' do
  it 'shows the name of the supermarket and alink to view its items' do
    safeway = Supermarket.create!(name: 'Safeway', location: 'Arvada, CO')
    ks = Supermarket.create!(name: 'King Soopers', location: 'Denver, CO')
    sprouts = Supermarket.create!(name: 'Sprouts', location: 'Centennial, CO')

    mike = Customer.create!(name: 'Mike Dao', supermarket_id: sprouts.id)
    dani = Customer.create!(name: 'Dani Coleman', supermarket_id: safeway.id)
    chris = Customer.create!(name: 'Chris Simmons', supermarket_id: ks.id)
    tyler = Customer.create!(name: 'Tyler Caudill', supermarket_id: safeway.id)
    gauri = Customer.create!(name: 'Gauri Joshi', supermarket_id: sprouts.id)
    lucas = Customer.create!(name: 'Lucas Colwell', supermarket_id: ks.id)

    bread = Item.create!(name: 'Bread', price: 400)
    milk = Item.create!(name: 'Milk', price: 600)
    apples = Item.create!(name: 'Apples', price: 200)
    candy= Item.create!(name: 'Candy', price: 100)
    bananas = Item.create!(name: 'Bananas', price: 250)
    avocado = Item.create!(name: 'Avocado', price: 150)
    meat = Item.create!(name: 'Meat', price: 650)
    cheese = Item.create!(name: 'Cheese', price: 500)

    CustomerItem.create!(item_id: bread.id, customer_id: mike.id)
    CustomerItem.create!(item_id: milk.id, customer_id: mike.id)
    CustomerItem.create!(item_id: avocado.id, customer_id: mike.id)
    CustomerItem.create!(item_id: bread.id, customer_id: dani.id)
    CustomerItem.create!(item_id: cheese.id, customer_id: dani.id)
    CustomerItem.create!(item_id: meat.id, customer_id: dani.id)
    CustomerItem.create!(item_id: candy.id, customer_id: chris.id)
    CustomerItem.create!(item_id: bananas.id, customer_id: chris.id)
    CustomerItem.create!(item_id: milk.id, customer_id: chris.id)
    CustomerItem.create!(item_id: apples.id, customer_id: gauri.id)
    CustomerItem.create!(item_id: avocado.id, customer_id: gauri.id)
    CustomerItem.create!(item_id: bananas.id, customer_id: gauri.id)
    CustomerItem.create!(item_id: cheese.id, customer_id: tyler.id)
    CustomerItem.create!(item_id: candy.id, customer_id: tyler.id)
    CustomerItem.create!(item_id: milk.id, customer_id: tyler.id)
    CustomerItem.create!(item_id: meat.id, customer_id: lucas.id)
    CustomerItem.create!(item_id: bread.id, customer_id: lucas.id)
    CustomerItem.create!(item_id: apples.id, customer_id: lucas.id)

    visit supermarket_path(sprouts)

    expect(page).to have_content('Sprouts')
    expect(page).to have_link('Supermarket Items')
    expect(page).to_not have_content('Safeway')

    click_link('Supermarket Items')
    expect(current_path).to eq("/supermarkets/#{sprouts.id}/items")
    expect(page).to have_content("#{sprouts.name} Items")
    expect(page).to_not have_content("#{safeway.name} Items")

    within '#items-0' do
      expect(page).to have_content('Bread')
    end

    within '#items-1' do
      expect(page).to have_content('Milk')
    end

    within '#items-2' do
      expect(page).to have_content('Apples')
    end

    within '#items-3' do
      expect(page).to have_content('Bananas')
    end

    within '#items-4' do
      expect(page).to have_content('Avocado')
    end

    expect(page).to_not have_content('Meat')
    expect(page).to_not have_content('Cheese')
    expect(page).to_not have_content('Candy')

    visit supermarket_path(ks)

    expect(page).to have_content('King Soopers')
    expect(page).to have_link('Supermarket Items')
    expect(page).to_not have_content('Safeway')

    click_link('Supermarket Items')
    expect(current_path).to eq("/supermarkets/#{ks.id}/items")
    expect(page).to have_content("#{ks.name} Items")
    expect(page).to_not have_content("#{safeway.name} Items")

    within '#items-0' do
      expect(page).to have_content('Bread')
    end

    within '#items-1' do
      expect(page).to have_content('Milk')
    end

    within '#items-2' do
      expect(page).to have_content('Apples')
    end

    within '#items-3' do
      expect(page).to have_content('Candy')
    end

    within '#items-4' do
      expect(page).to have_content('Bananas')
    end
    
    within '#items-4' do
      expect(page).to have_content('Meat')
    end

    expect(page).to_not have_content('Cheese')
    expect(page).to_not have_content('Avocado')
  end
end

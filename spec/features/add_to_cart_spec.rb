require 'rails_helper'

RSpec.feature "When you click on add to cart the cart count goes up", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  
  scenario "They see all products" do
    visit '/products'
    save_screenshot 'start.png'
    myCart = page.find('li', text: 'My Cart').text
    first(:button, 'Add').click
    myCart2 = page.find('li', text: 'My Cart').text
    save_screenshot 'end.png'
    expect(myCart != myCart2)
  end

end
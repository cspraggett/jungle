require 'rails_helper'

RSpec.feature "Visitor can click on product to see a description", type: :feature, js: true do

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
  
  # scenario "They see all products" do
  #   # ACT
  #   visit root_path

  #   # DEBUG / VERIFY
  #   save_screenshot

  #   expect(page).to have_css 'article.product', count: 10
  # end

  scenario "They click on display product button and see product detail page" do 
    p = Product.all.sample

    visit '/'

    expect(page).to have_text(p.name)

    firstButton = page.find(:xpath, "//a/h4", text: p.name)
    firstButton.click
    expect(page).to have_selector 'section.products-show'
    save_screenshot
    
  end
end
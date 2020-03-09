require 'rails_helper'

RSpec.describe Product, type: :model do
  
  it 'product is valid with all fields filled in' do
    @category = Category.new(name: "Electronics")
    @product = Product.new(name: "useless thing", quantity: 20, price: 200000, category: @category)   
    @product.save!    
    expect(@product).to be_present
  end
  
  it 'displays correct error message when name isn\'t present' do
    @category = Category.new(name: "Electronics")

    @product = Product.new(name: nil, quantity: 20, price: 200000, category: @category)   
    @product.save
    expect(@product.errors.messages[:name].first).to eq "can't be blank"

   end
  it 'displays correct error message when quantity isn\'t present' do
    @category = Category.new(name: "Electronics")
    @product = Product.new(name: "useless thing", quantity: nil, price: 200000, category: @category)   
    @product.save
    expect(@product.errors.messages[:quantity].first).to eq "can't be blank"
   end

  it 'displays correct error message when price isn\'t present' do
    @category = Category.new(name: "Electronics")
    @product = Product.new(name: "useless thing", quantity: 20, price: nil, category: @category)   
    @product.save
    expect(@product.errors.messages[:price].first).to eq "is not a number"
   end

  it 'displays correct error message when category isn\'t present' do
    # @category = Category.new(name: "Electronics")
    @product = Product.new(name: "useless thing", quantity: 20, price: 200000, category: nil) 
    @product.save
    # byebug 
    expect(@product.errors.messages[:category].first).to eq "can't be blank"
   end
   
end

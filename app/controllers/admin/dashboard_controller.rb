class Admin::DashboardController < ApplicationController
  
  def show
    @productCount = Product.all.size
    @categoryCount = Category.all.size
  end
end

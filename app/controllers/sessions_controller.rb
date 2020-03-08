class SessionsController < ApplicationController

  def new
  end
  
  def create
    
    # @test = User.find_by_email("cspraggett@gmail.com")
    # raise @test.inspect
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      # raise @user[:email].inspect
      session[:user_id] = user.id
      redirect_to '/'
    else 
      redirect_to '/login'
    end
  end

  def destroy
    # raise "i'm in destroy"
    session[:user_id] = nil
    redirect_to '/'
  end

end

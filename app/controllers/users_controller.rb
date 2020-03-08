class UsersController < ApplicationController
  def new
    
  end

  def create
    # raise  @_response.inspect
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/', notice: 'Account created successfully'
    else
      flash[:error] = 'An error occured!'
      render 'new'
    end
  end
  
  private
  
  def user_params
    # raise  @_params.inspect
    params.require(:@user).permit(:fname, :lname, :email, :password, :password_confirmation)
  end

end

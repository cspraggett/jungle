require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validates that full object is saved' do 
      @user = User.new(fname: "nil", lname: "Sagat", email: "bs@gmail.com", password: "123123", password_confirmation: "123123") 
      @user.save!
      expect(@user).to be_present
    end 
    
    it 'validates that passwords have to match' do
      @user = User.new(fname: "nil", lname: "Sagat", email: "bs@gmail.com", password: "124123", password_confirmation: "123123")  
      @user.save
      expect(@user.errors.messages[:password].first).to eq "passwords don't match"
    end 

    it 'validates that email does not exist in database' do 
      @user = User.new(fname: "Bob", lname: "Sagat", email: "abcdt@gmail.com", password: "123123", password_confirmation: "123123")  
      @user.save
      @user1 = User.new(fname: "Bob", lname: "Sagat", email: "   abCdt@gmail.com  ", password: "123123", password_confirmation: "123123")
      @user1.save
      expect(@user1.errors.messages[:email].first).to eq "email already exists"
    end

    it 'validates that password must be atleast 6 characters' do
      @user = User.new(fname: "Bob", lname: "Sagat", email: "abcdt@gmail.com", password: "12345", password_confirmation: "12345")  
      @user.save
      expect(@user.errors.messages[:password].first).to eq "is too short (minimum is 6 characters)"
    end     
  end

  describe '.authenticate_with_credentials' do
    it 'validates that a correct password and email will be logged in' do
      @user = User.new(fname: "Bob", lname: "Sagat", email: "abcd@abc.com", password: "123456", password_confirmation: "123456")
      @user.save
      expect(@user).to be_present
    end

    # it 'throws error when password does not match' do

    # end
    
  end
  
end

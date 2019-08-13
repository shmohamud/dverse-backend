
require "byebug"
class Api::V1::AuthController < ApplicationController

  def create # POST /api/v1/login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      #  byebug 
      #where user exists AND password is a match
      #send back the user data, and a token
      payload = {"user_id": @user.id}
      token = encode(payload)
     
      render json: {
        user: @user,
        token: token,
        authenticated: true
      }
    else
      # byebug
      #where user doesn't exist OR the password isn't correct
      render json: {
        message: "INCORRECT! YOU ARE A FRAUD!",
        authenticated: false
      }
    end
  end

end
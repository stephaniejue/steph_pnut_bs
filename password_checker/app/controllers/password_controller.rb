class PasswordController < ApplicationController

  def check
    @user_id = params[:userid]
    @password = params[:password]

    if @user_id == nil || @password == nil
      flash.now[:alert] = "Enter your credentials"
    else
      if @user_id.length < 6 || @password.length < 6
        flash.now[:alert] = "Try again!"
      elsif @user_id.include?("$") || @user_id.include?("#") || @user_id.include?("!")
        flash.now[:alert] = "Try again!"
      elsif (!@password.include?("$") && !@password.include?("#") && !@password.include?("!"))
        flash.now[:alert] = "Try again!"
      elsif @user_id == @password
        flash.now[:alert] = "Try again!"
      else
        flash.now[:alert] = "Credentials are acceptable"
      end
    end

  end





end

class UserController < ApplicationController
  def registration
    if params.has_key?(:full_name) && params.has_key?(:address) && params.has_key?(:city) && params.has_key?(:state) && params.has_key?(:zip_code) && params.has_key?(:country) && params.has_key?(:email) && params.has_key?(:user_id) && params.has_key?(:password) && !params[:full_name].strip.empty? && !params[:address].strip.empty? && !params[:city].strip.empty? && !params[:state].strip.empty? && !params[:zip_code].strip.empty? && !params[:country].strip.empty? && !params[:email].strip.empty? && !params[:user_id].strip.empty? && !params[:password].strip.empty?
      @full_name = params[:full_name]
      @address = params[:address]
      @city = params[:city]
      @state = params[:state]
      @zip_code = params[:zip_code]
      @country = params[:country]
      @email = params[:email]
      @user_id = params[:user_id]
      @password = params[:password]
    else
      flash.now[:alert] = "please complete the form"
    end
  end

  def confirmation
  end
end

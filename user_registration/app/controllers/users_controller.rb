class UsersController < ApplicationController
  def registration
    if session[:user] == nil && params.has_key?(:full_name) && params.has_key?(:address) && params.has_key?(:city) && params.has_key?(:state) && params.has_key?(:zip_code) && params.has_key?(:country) && params.has_key?(:email) && params.has_key?(:user_id) && params.has_key?(:password) && !params[:full_name].strip.empty? && !params[:address].strip.empty? && !params[:city].strip.empty? && !params[:state].strip.empty? && !params[:zip_code].strip.empty? && !params[:country].strip.empty? && !params[:email].strip.empty? && !params[:user_id].strip.empty? && !params[:password].strip.empty?
      full_name = params[:full_name]
      address = params[:address]
      city = params[:city]
      state = params[:state]
      zip_code = params[:zip_code]
      country = params[:country]
      email = params[:email]
      user_id = params[:user_id]
      password = params[:password]
      @user = User.new(full_name, address, city, state, zip_code, country, email, user_id, password)
      Rails.logger.info @user.inspect
      session[:user] = @user.to_yaml
      redirect_to "/users/confirmation"
    else
      flash.now[:alert] = "Please complete the form"
    end
  end

  def confirmation
    @user = YAML.load(session[:user])
  end

  def login
    @user = YAML.load(session[:user])
    if params.has_key?(:user_id_login) && params.has_key?(:password_login)
      user_id_login = params[:user_id_login]
      password_login = params[:password_login]
      if @user.user_id == user_id_login && @user.password == password_login
        redirect_to "/users/profile"
      else
        flash.now[:alert] = "Log in failed, try again"
      end
    else
      if !params.has_key?(:user_id_login) && !params.has_key?(:password_login)
        flash.now[:alert] = "Please enter your credentials"
      end
    end
  end

  def profile
    @user = YAML.load(session[:user])
  end

  def logout
    @user = YAML.load(session[:user])
    params[:user_id_login] = nil
    params[:password_login] = nil
    # need to save login info back to sessiomn then clear it again

    redirect_to "/users/login"
  end



end

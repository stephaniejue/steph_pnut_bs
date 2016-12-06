class GameController < ApplicationController

  def try
    cookies[:user_name] = params[:user_name] unless params[:user_name].nil?
    @user_name = cookies[:user_name].to_s

    # Another counter that works with @tries and cookies
    if cookies[:tries] == nil
      @tries = 0
    elsif params[:guess].to_i > 0
      @tries = cookies[:tries].to_i
      @tries += 1
    end
    cookies[:tries] = @tries


    if cookies[:secret_number] == nil
      cookies[:secret_number] = rand(1..100)
    end
    @secret_number = cookies[:secret_number].to_i

    @guess = params[:guess].to_i

    if !(params[:guess].to_i > 0)
      @result = "Guess a number..."
    elsif @secret_number > @guess
      @result = "Too low. Guess again."
    elsif @secret_number < @guess
      @result = "Too high. Guess again."
    elsif @secret_number == @guess
      @result = "You WIN!!!"
    end

    render "try.html.erb"

  end

  def reset
    cookies[:tries] = ""
    cookies[:secret_number] = rand(1..100)
    @guess = ""
    @result = ""
    redirect_to :game
  end

end

class GameController < ApplicationController

  def try
    #
    # Another counter that works with @tries and cookies
    if cookies[:tries] == nil
      @tries = 0
    elsif params[:guess].to_i > 0
      @tries = cookies[:tries].to_i
      @tries += 1
    end
    cookies[:tries] = @tries


    # Get secret_number and guess cookies
    cookies[:secret_number] = params[:secret_number] unless params[:secret_number].nil?
    @secret_number = cookies[:secret_number].to_i
    @guess = params[:guess].to_i

    if !(params[:guess].to_i > 0)
      @result = "Guess a number"
    elsif @secret_number > @guess
      @result = "Too low, guess again!"
    elsif @secret_number < @guess
      @result = "Too high, guess again!"
    elsif @secret_number == @guess
      @result = "You WIN!!!"
    end



    #Get tries cookie
    # @tries = cookies[:tries].to_i
    #
    # # Increment @tries counter
    # if @tries == nil
    #   @tries = 0
    # else
    #   @tries += 1
    # end

    # Set cookie
    # cookies[:tries] = @tries

    render "try.html.erb"

  end

  def reset
    cookies[:tries] = ""
    cookies[:secret_number] = ""
    @guess = ""
    @result = ""
    try()
  end

end

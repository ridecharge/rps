class PlaysController < ApplicationController

  def new
  end

  def throw
    throws = %w{rock paper scissors}
    user_throw = throw_params[:sign]
    url = "https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw"
    uri = URI(url)
		response = Net::HTTP.get(uri)
		body = JSON.parse(response)
  	@server_throw = body['body'].gsub(/\"/,'') if body['body']
  	@server_throw = throws[rand(3)] if body['errorMessage'] || body['statusCode'] != 200
    
    if user_throw == @server_throw
      @status = "TIE"
    elsif !(throws.include? @server_throw)
      @server_throw = "undefined"
      @status = "YOU WIN!"
      @message = "Curb used a prohibited item"
    elsif (user_throw == throws[0] &&  @server_throw == throws[2]) || (user_throw == throws[1] &&  @server_throw == throws[0]) || (user_throw == throws[2] &&  @server_throw == throws[1]) 
      @status = "YOU WIN!"
      @message = "Curb with #{@server_throw} lost"
    else
      @status = "YOU LOSE!"
      @message = "Curb with #{@server_throw} win"
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  private
    def throw_params
      params.permit(:sign)
    end

end

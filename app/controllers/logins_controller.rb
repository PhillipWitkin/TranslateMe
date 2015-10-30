class LoginsController < ApplicationController

  def create
    # looking for user in DB

    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])

      session[:user_id] = user.id
      redirect_to root_path

    else
      @message = "NO WRONG TRY AGIN"
      render :new
    end


  end

  def new
    @current_user = current_user
    render :new
    # @current_user
    # Demonstrating a possible use of current_user method - brings logged-in users bak to homepage if they try to log in again.
    # if current_user
    #   redirect_to root_path
    # end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
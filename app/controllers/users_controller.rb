class UsersController < ApplicationController
  def new

  end


  def create
    user = User.new(user_params)
    if params[:checkbox] == "on"
      if user.save
        redirect_to ("/login/new")
      else
        @message = user.errors.full_messages[0]
        render :new
      end
    else
      @message = "Please agree to our terms"
      render :new
    end
  end

  private
    def user_params
      # params.permit(:username, :password)
      params[:user] = params
      params.require(:user).permit(:username, :password)
  end

end
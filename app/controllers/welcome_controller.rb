class WelcomeController < ApplicationController
  def index
    if current_user

  # testing out user contributions
      render :logged_index
      # render :phil_test
    else
      render :index
    end
  end


end
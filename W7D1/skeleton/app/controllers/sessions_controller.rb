class SessionsController < ApplicationController
  def new
  
    render :new
  end

  def create
    log_in(user)
  end

  def destroy
    logout
  end

end

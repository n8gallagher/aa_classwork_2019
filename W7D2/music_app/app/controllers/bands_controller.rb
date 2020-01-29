class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def new
    render :new
  end

  def show
    
  end

end

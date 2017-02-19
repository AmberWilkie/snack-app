class HomeController < ApplicationController
  def index

  end

  def show
    # binding.pry
    @user = User.find(params[:id])
  end
end

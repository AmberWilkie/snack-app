class HomeController < ApplicationController
  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def matches

  end
end

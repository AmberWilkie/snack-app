class UsersController < ApplicationController
  def user_params
    binding.pry
    params.require(:user).permit(:name, :tag_list) ## Rails 4 strong params usage
  end
end

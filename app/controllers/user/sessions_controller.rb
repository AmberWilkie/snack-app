class User::SessionsController < Devise::SessionsController
  def new
    super
  end

  protected

  def after_sign_in_path_for(resource)
    build_language_list
    user_path(resource)
  end

  def build_language_list
    # this is so wrong, don't know why I can't get it working from sign_up_params
    @user.language_list = params[:user][:language_list]
    @user.learning_list = params[:user][:learning_list]
    @user.save
  end
end
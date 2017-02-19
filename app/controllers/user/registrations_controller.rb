class User::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  protected

  def after_sign_up_path_for(resource)

    # this is so wrong, don't know why I can't get it working from sign_up_params
    @user.language_list = params[:user][:language_list]
    @user.save

    home_path(resource)
  end

  def sign_up_params
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation,
                                 :name,
                                 :location,
                                 :blurb,
                                 :gender,
                                 :language_list)

  end
end
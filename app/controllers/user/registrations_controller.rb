class User::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  protected

  def after_sign_up_path_for(resource)
    home_path(resource)
  end

  def sign_up_params
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation,
                                 :name,
                                 :location,
                                 :blurb,
                                 :gender)

  end
end
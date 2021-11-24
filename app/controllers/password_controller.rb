class PasswordController < ApplicationController
  before_action :require_user_logged_in!

  def edit; end

  def update
    if Current.user.update(password_params)
      flash[:notice] = 'Password has been changed successfully!'
      redirect_to root_path
    else
      render :edit
    end
  end

  private

    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end

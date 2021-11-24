# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    Current.user = User.find(session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in!
    redirect_to login_path, alert: 'You must be logged in to perform this action!' unless Current.user.present?
  end
end

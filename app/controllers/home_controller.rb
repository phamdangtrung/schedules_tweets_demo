# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find_by(id: session[:user_id]) # find the user
    end
    # flash.now[:notice] = 'Logged in successfully!'
    # flash.now[:alert] = 'Invalid email or password!'
  end
end

# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    flash.now[:notice] = 'Logged in successfully!'
    flash.now[:alert] = 'Invalid email or password!'
  end
end
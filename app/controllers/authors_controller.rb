class AuthorsController < ApplicationController
  def index
    @authors = User.where.not(id: Current.user.id).order(id: :desc)
  end
end

class PostController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @posts = Post.find_by(user_id: Current.user.id)
  end

  def new
    @post = Post.new
  end
end

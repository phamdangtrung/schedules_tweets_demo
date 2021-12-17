class PostsController < ApplicationController
  before_action :require_user_logged_in!
  # , :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.where(user_id: Current.user.id).order(created_at: :desc)
  end

  def author_posts
    @posts = Post.where('user_id = ? AND is_public = true', params[:id]).order(created_at: :desc)
  end

  # GET /posts/1 or /posts/1.json
  def show
    return @post = Post.find(params[:id]) if viewable?

    flash[:alert] = 'Nice try! But you are not authorized.'
    redirect_to action: 'index'
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    return @post = Post.find(params[:id]) if editable?

    flash[:alert] = 'Nice try! But you are not authorized.'
    redirect_to action: 'index'
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params.merge(user_id: Current.user.id))

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post = Post.update(params[:id], post_params)
    respond_to do |format|
      if @post.errors.any?
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      else
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    return flash[:alert] = 'Nice try! But you are not authorized.' unless editable?

    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :is_public, :body, :user_id)
    end

    def editable?
      return true unless Current.user.id != Post.find(params[:id]).user_id
    end

    def viewable?
      return true unless Current.user.id != Post.find(params[:id]).user_id && Post.find(params[:id]).is_public == false
    end
end

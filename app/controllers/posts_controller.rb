class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :delete]
  before_action :authenticate_admin!, except: [:index, :show]


  def index
    if params[:query].present?
      @posts = Post.where("title ILIKE ?", "%#{params[:query]}%")
    elsif params[:category]
      @posts = Post.where(:category => params[:category])
    else
      @posts = Post.all.order(created_at: :desc)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Successfully created post!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Error creating new post!"
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
        redirect_to post_path(@post)
        # redirect_to(:action => 'posts#show')
    else
        render 'edit'
    end
  end

  def show
    @posts = Post.all.order(created_at: :desc)
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Successfully deleted post!"
      redirect_to posts_path
    else
      flash[:alert] = "Error updating post!"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :tagline, :category, :body, :photo, :recipe_photo, :servings, :preptime, :cooktime, ingredients_attributes:[:id, :name, :_destroy], directions_attributes:[:id, :body, :_destroy])
  end

  def find_post
    @post = Post.find(params[:id])
  end
end

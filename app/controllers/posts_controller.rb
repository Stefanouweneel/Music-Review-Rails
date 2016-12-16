class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id if current_user

    if @post.save
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.new(post_params)

    if @post.update_attributes(post_params)
      redirect_to :action => 'show', :id => @post
    else
      @posts = Post.all
      render :action => 'edit'
    end
  end

  def delete
    Post.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

  def post_params
    params.require(:post).permit(:text)
  end
end

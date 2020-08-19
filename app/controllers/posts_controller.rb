class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :content,
      :spoiler,
      :category_id
    ).merge(user_id: current_user.id)
  end
end
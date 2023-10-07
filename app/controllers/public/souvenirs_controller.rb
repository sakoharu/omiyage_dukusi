class Public::SouvenirsController < ApplicationController

  def search_area
  end

  def search_genre
  end

  def index
  end

  def new
    @posts = Post.new
  end

  def create
    posts = Post.new(post_params)
    posts.save
    redirect_to souvenirs_path
  end

  def show
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end

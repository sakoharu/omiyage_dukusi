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
    redirect_to souvenirs
  end

  def show
  end
end

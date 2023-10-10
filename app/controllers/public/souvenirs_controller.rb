class Public::SouvenirsController < ApplicationController

  def search_area
  end

  def search_genre
  end

  def index
    @souvenir = Souvenir.all
  end

  def new
    @souvenir = Souvenir.new
  end

  def create
    @souvenir = current_customer.souvenirs.new(souvenir_params)
    @souvenir.save
    redirect_to souvenirs_path
  end

  def show
  end


  private

  def souvenir_params
    params.require(:souvenir).permit(:item_name, :body, :price, :prefecture_id, :genre_id, :image)
  end
end

class Public::SouvenirsController < ApplicationController

  def search_area
  end

  def search_genre
  end

  def index
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
    params.require(:souvenir).permit(:item_name, :store_name, :image)
  end
end

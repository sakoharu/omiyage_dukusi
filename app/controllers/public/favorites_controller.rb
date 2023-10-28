class Public::FavoritesController < ApplicationController


  def create
    souvenir = Souvenir.find(params[:sourvenir_id])
    favorite = current_customer.favorites.new(souvenir_id: souvenir.id)
    favorite.save
    if (params[:search_prefecture_id])
      redirect_to search_area_souvenirs_path(prefecture_id: params[:search_prefecture_id])
    else
      redirect_to souvenirs_path(souvenir)
    end
  end

  def destroy
    souvenir = Souvenir.find(params[:sourvenir_id])
    favorite = current_customer.favorites.find_by(souvenir_id: souvenir.id)
    favorite.destroy
    if (params[:search_prefecture_id])
      redirect_to search_area_souvenirs_path(prefecture_id: params[:search_prefecture_id])
    else
      redirect_to souvenirs_path(souvenir)
    end
  end

 def index
 end

end

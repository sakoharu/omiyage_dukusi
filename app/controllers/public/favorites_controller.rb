class Public::FavoritesController < ApplicationController


  def create
    souvenir = Souvenir.find(params[:sourvenir_id])
    favorite = current_customer.favorites.new(souvenir_id: souvenir.id)
    favorite.save
    redirect_to souvenirs_path(souvenir)
  end

  def destroy
    souvenir = Souvenir.find(params[:sourvenir_id])
    favorite = current_customer.favorites.find_by(souvenir_id: souvenir.id)
    favorite.destroy
    redirect_to souvenirs_path(souvenir)
  end

 def index
 end

end

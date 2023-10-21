class Public::FavoritesController < ApplicationController


  def souvenir
    @souvenir = Souvenir.find(params[:souvenir_id])
  end
  
  def index
  end
  

  def create
    souvenir = Souvenir.find(params[:souvenir_id])
    favorite = current_customer.favorites.new(souvenir_id: souvenir.id)
    favorite.save
    redirect_to souvenirs_path(souvenir)
  end

  def destroy
    souvenir = Souvenir.find(params[:souvenir_id])
    favorite = current_customer.favorites.find_by(souvenir_id: souvenir.id)
    favorite.destroy
    redirect_to souvenirs_path(souvenir)
  end

 

end

class Public::SouvenirsController < ApplicationController

  def search_area
    @souvenirs = Souvenir.where(prefecture_id: params[:prefecture_id])
    
  end

  def search_genre
     @souvenirs = params[:souvenir]

    if @souvenirs == "Souvenir"
      @souvenirs = Souvenir.looks(params[:search], params[:word])
    end
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @souvenirs = Souvenirs.where("item_name LIKE?","#{word}")
    elsif search == "forward_match"
      @souvenirs = Souvenirs.where("item_name LIKE?","#{word}")
    elsif search == "backward_match"
      @souvenirs = Souvenirs.where("item_name LIKE?","#{word}")
    elsif search == "partial_match"
      @souvenirs = Souvenirs.where("item_name LIKE?","#{word}")
    else
      @souvenirs = all
    end
  end

  def index
    @souvenirs = Souvenir.all
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
    @souvenir = Souvenir.find(params[:id])
    @comment = Comment.new
    @customer = current_customer
  end

  def edit
    @souvenir = Souvenir.find(params[:id])
  end

  def update
    souvenir = Souvenir.find(params[:id])
    souvenir.update(souvenir_params)
    redirect_to customer_path(current_customer.id)
  end

  def destroy
    souvenir = Souvenir.find(params[:id])
    souvenir.destroy
    redirect_to customer_path(current_customer.id)
  end


 private

  def souvenir_params
    params.require(:souvenir).permit(:item_name, :body, :price, :prefecture_id, :genre_id, :image)
  end

end
class Public::SouvenirsController < ApplicationController
  before_action :load_prefectures, only: [:new, :create, :edit, :update, :search_area, :search_genre, :index, :show, :destroy]

  def search_area
    @souvenirs = Souvenir.where(prefecture_id: params[:prefecture_id])

  end

  def search_genre
     #@souvenirs = params[:souvenir]

    #if @souvenirs == "Souvenir"
      @souvenirs = Souvenir.looks(params[:search], params[:word])
   # end
  end



  def index
    @souvenirs = Souvenir.all
  end

  def new
    @souvenir = Souvenir.new
    # load_prefectures
    # puts "Prefectures: #{@prefectures}"
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

  def load_prefectures
    @prefectures = {
      "0" => ["北海道"],
      "1" => ["青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県"],
      "2" => ["新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県", "愛知県"],
      "3" => ["三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県"],
      "4" => ["鳥取県", "島根県", "岡山県", "広島県", "山口県"],
      "5" => ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"],
      "6" => ["徳島県", "香川県", "愛媛県", "高知県"],
      "7" => ["福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県"],
      "8" => ["沖縄県"],
    }
  end

end
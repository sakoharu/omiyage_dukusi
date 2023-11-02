class Souvenir < ApplicationRecord
   has_one_attached :image
   belongs_to :customer
   belongs_to :prefecture
   has_many :comments, dependent: :destroy
   has_many :favorites, dependent: :destroy


  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

   def self.looks(search, word)
    if search == "perfect_match"
      @souvenirs = Souvenir.where("item_name LIKE?","#{word}")
    elsif search == "forward_match"
      @souvenirs = Souvenir.where("item_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @souvenirs = Souvenir.where("item_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @souvenirs = Souvenir.where("item_name LIKE?","%#{word}%")
    else
      @souvenirs = Souvenir.all
    end
  end

   def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
   end
end

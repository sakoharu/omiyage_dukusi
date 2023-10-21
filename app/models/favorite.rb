class Favorite < ApplicationRecord

  belongs_to :souvenir
  belongs_to :customer

  validates :customer_id, uniqueness: {scope: :souvenir_id}
end

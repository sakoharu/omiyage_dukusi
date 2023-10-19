class Favorite < ApplicationRecord

  belomgs_to :souvenir
  belomgs_to :customer

  validates :customer_id, uniqueness: {scope: :souvenir_id}
end

class Comment < ApplicationRecord

  belongs_to :souvenir
  belongs_to :customer
end

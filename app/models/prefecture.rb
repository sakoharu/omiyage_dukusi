class Prefecture < ApplicationRecord
  has_many :souvenirs

  enum region: {hokkaido: 0, tohoku: 1, hokuriku: 2, cyubu: 3, cyugoku: 4, kantou: 5, sikoku: 6, kyusyu: 7, okinawa: 8 }
end

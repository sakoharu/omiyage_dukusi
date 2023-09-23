Rails.application.routes.draw do
  devise_for :genres
  devise_for :book_marks
  devise_for :comments
  devise_for :posts
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

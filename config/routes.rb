Rails.application.routes.draw do
  
# 顧客用
scope module: :public do
 #root 'homes#top'
  get '/' => 'homes#top'
  get 'souvenirs/search_area' => 'souvenir#search_area'
  get 'souvenirs/search_genre' => 'souvenir#search_genre'
  get 'souvenirs' => 'souvenirs#index'
  get 'souvenirs/new' => 'souvenirs#new'


end

 devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
}



# 管理者用
namespace :admin do
  
 
end 

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

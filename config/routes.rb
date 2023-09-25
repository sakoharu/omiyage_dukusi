Rails.application.routes.draw do
  
# 顧客用
scope module: :public do
  root 'homes#top'
  get 'souvenirs/search_area' => 'souvenir#search_area'
  get 'souvenirs/search_genre' => 'souvenir#search_genre'
  get 'souvenirs' => 'souvenirs#index'
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
}

end



# 管理者用
namespace :admin do
  
  
  
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
}

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

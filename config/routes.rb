Rails.application.routes.draw do

# 顧客用
scope module: :public do
 #root 'homes#top'
  get '/' => 'homes#top'
  resources :souvenirs, only: %i(index new create show) do
    collection do
      get :search_area
      get :search_genre
    end
  end
  
  resources :souvenirs, only: %i(show edit update destroy) 
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

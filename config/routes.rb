Rails.application.routes.draw do

# 顧客用
scope module: :public do
  root 'homes#top'
  get '/' => 'homes#top'
  #get '/souvenirs' => '/souvenirs#new'
  resources :souvenirs, only: %i(index new create show) do
    collection do
      get :search_area
      get :search_genre
    end
  end

  #get 'customers' => 'CustomerController#index'
  #get 'customers/new'=>'CustomerController#new'
  #post 'customers' => 'CustomerController#create'
  #get 'customers/:id/edit'=>'CustomerController#edit'
  #patch 'customers/:id' => 'CustomerController#update'
  #get 'customers/:id'=>"CustomerController#show"
  #delete 'customers/:id'=> 'CustomerController#destroy'

  resources :customers, only: %i(show edit update destroy)
  resources :favorites, only: %i(index create destroy)
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

Rails.application.routes.draw do
  # scope "(:locale)", locale: /en|de/ do

  get '/contact' => 'static#contact'
  get '/about' => 'static#about'

  resources :breeders

  resources :horses do
    member do
      get 'progeny'
    end
  end

root to: 'home#index'

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end

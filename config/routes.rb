Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'links#new'
  
  resources :links, only: [:new, :create] do 
  	collection do 
  		get 'stats'
  	end
  end

  get '/stats' => 'links#stats'

end


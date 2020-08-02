Rails.application.routes.draw do
	resources :contacts do
		
		resource :kind, only: :show
		resource :kind, only: :show, path: 'relashionships/kind'
		
		resource :phones, only: :show
		resource :phones, only: :show, path: 'relashionships/phones'
		
		resource :address, only: %i[ show update create destroy]
		resource :address, only: %i[ show update create destroy], path: 'relashionships/address'
	end
end

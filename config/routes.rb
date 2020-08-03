Rails.application.routes.draw do

	resources :contacts do
		
		resource :kind, only: :show
		resource :kind, only: :show, path: 'relashionships/kind'
		
		resource :phones, only: %i[ show destroy ]
		resource :phones, only: %i[ show destroy ], path: 'relashionships/phones'

		resource :phone, only: %i[ create update ]
		resource :phone, only: %i[ create update ], path: 'relashionships/phone'
		
		resource :address, only: %i[ show update create destroy]
		resource :address, only: %i[ show update create destroy], path: 'relashionships/address'
	end

end

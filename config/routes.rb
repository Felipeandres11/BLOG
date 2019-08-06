Rails.application.routes.draw do

  get 'pages', to: 'pages#dashboard'
  get 'pages/:id', to: 'pages#change_role'

	resources :posts do
		resources :comments, only: [:create, :destroy]
	end

	resources :pages do
		resources :users, only: [:create, :destroy, :edit]
    end

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		registrations: 'users/registrations'
	}

	root 'posts#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
	devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'homes#top'
	get '/about' => 'homes#about'

	resources :users, only:[:show, :edit, :update] do
	  collection do
	  	get :hide
	  	patch :is_deleted
	  end
	end


	resources :posts, only:[:new, :show, :create, :edit, :update, :destroy] do
		resource :likes, only:[:create, :destroy]
		resources :comments, only:[:create, :destroy]
		collection do
		  get :search
		end
	end
end

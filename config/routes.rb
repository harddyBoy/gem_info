Rails.application.routes.draw do
	devise_for :users
	get 'gem_infos/index'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
 	# root 'application#scrape_reddit'

	resources :gem_infos 
	resources :users

	root 'gem_infos#index'		      

end

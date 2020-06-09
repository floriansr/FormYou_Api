Rails.application.routes.draw do
  resources :courses
  devise_for :administrators
  resources :administrators
  devise_for :instructors
  resources :instructors
  devise_for :users

	 namespace :api do
 		 namespace :v1 do
    		resources :users, except: %i[create new edit]
  		end
 	end
end

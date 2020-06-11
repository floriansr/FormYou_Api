Rails.application.routes.draw do
  resources :inscriptions
  resources :sessions
  resources :join_table_course_categories
  devise_for :students
  resources :students
  resources :categories
  resources :rooms
  devise_for :administrators
  resources :administrators
  devise_for :instructors
  resources :instructors
  devise_for :users

	 namespace :api do
 		 namespace :v1 do
    		resources :users, except: %i[create new edit]
				resources :courses, except: %i[new edit]
  		end
 	end
end

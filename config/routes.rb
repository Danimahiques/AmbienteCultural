Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do 
  #resources :home, :sessions, :only => [:create]
  resources :pelicula, :libros
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users', to: 'users#index', as: 'users_path'
  get '/usuarios', to: 'usuario#index', as: 'usuarios_path'
  root 'home#index'
  get '/usuarios/new',      to: 'usuario#new'
  post '/usuarios',         to: 'usuario#crear'
  get '/peliculas',         to: 'pelicula#index', as: 'peliculas_path'
  get '/peliculas/new',     to: 'pelicula#_form'
  post '/peliculas',        to: 'pelicula#crear'
  post '/peliculas/:id',     to: 'pelicula#eliminar'
  get '/peliculas/show/:id',     to: 'pelicula#show'
  post '/peliculas/show/:id',     to: 'pelicula#show'
  get '/peliculas/editar/:id',     to: 'pelicula#edit'
  post '/peliculas/editar/:id', to: "pelicula#edit"
  get '/libros',            to: 'libros#index', as: 'libros_path'
  get '/libros/new',        to: 'libros#_form'
  post '/libros',           to: 'libros#crear'
  post '/libros/:id',     to: 'libros#eliminar'
  get '/libros/show/:id',     to: 'libros#show'
  post '/libros/show/:id',     to: 'libros#show'
  get '/libros/editar/:id',     to: 'libros#edit'
  post '/libros/editar/:id', to: "libros#edit"
  post '/usuarios/:id',     to: 'usuario#eliminar'
  get  '/usuarios/login',   to: 'usuario#login', as: 'sessions_path'
  post '/login',            to: 'sessions#create'
  #get   "users/sign_up",    to: "users/registrations#new"
  post  "users/sign_up",    to: "users/registrations#create"
  post  "users/eliminar/",   to: "users#eliminar"
  #get   "users/sign_in",    to: "users/sessions#new"
  #post  "users/sign_in",    to: "users/sessions#create"
  #get  '/users/sign_out',   to: "users/sessions#destroy"
end
end
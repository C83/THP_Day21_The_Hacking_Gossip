Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :gossips
  # pour les comments, on n'utilse pas ressources car certaines fonctions seront intégrées aux views de gossip
  post 'comments', to: 'comments#create', as: 'comments'
  get 'comments/:id/edit', to:'comments#edit' , as: 'edit_comment'
  get '/comments/:id', to:'comments#show', as: 'comment'
  delete '/comments/:id', to:'comments#destroy'
  put '/comments/:id', to:'comments#update'
  patch '/comments/:id', to:'comments#update'
end

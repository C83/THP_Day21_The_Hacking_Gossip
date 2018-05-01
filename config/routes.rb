Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :gossips
  # pour les comments, on n'utilse pas ressources car certaines fonctions seront intégrées aux views de gossip
  post 'comments', to: 'comments#create', as: 'comments'
end

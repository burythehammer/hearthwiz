Rails.application.routes.draw do

  get 'dashboard/index'
  root 'dashboard#index'

  get 'cards', to: 'cards#index'

  get 'cards/id/:id', to: 'cards#show_by_id'
  get 'cards/name/:name', to: 'cards#show_by_name'

  get 'cards/sets', to: 'card_sets#index'
  get 'cards/classes', to: 'player_classes#index'

  get 'cards/class/:name', to: 'player_classes#show'
  get 'cards/set/:name', to: 'card_sets#show'




  #resources :cards, :only => [:show, :index]
  resources :users, only: [:show, :index]

end

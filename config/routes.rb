Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :registrations]

  devise_scope :user do
    get    "login"   => "devise/sessions#new",         as: :new_user_session
    post   "login"   => "devise/sessions#create",      as: :user_session
    delete "signout" => "devise/sessions#destroy",     as: :destroy_user_session

    get    "signup"  => "devise/registrations#new",    as: :new_user_registration
    post   "signup"  => "devise/registrations#create", as: :user_registration
    put    "signup"  => "devise/registrations#update", as: :update_user_registration
    get    "account" => "devise/registrations#edit",   as: :edit_user_registration
  end

  resources :movies do
    resources :reviews, only: [:create] do
      member do
        get 'like'
      end
    end

    member do
      post 'set_genre'
      get 'like'
    end

    collection do
      post 'set_genres'
    end
  end

  #post 'movies/:movie_id/reviews', to: 'reviews#create', as: 'movie_reviews'

  root 'movies#index'

end

 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  resources :workflows
    authenticated :user, lambda { |u| u.admin? } do
      namespace :admin do
        resources :icons
        resources :workflows
        if defined?(Sidekiq)
          require 'sidekiq/web'
          mount Sidekiq::Web => '/sidekiq'
        end
 
        resources :announcements
        resources :users
        namespace :user do
          resources :connected_accounts
        end
        resources :teams
        resources :team_members
        resources :plans
        namespace :pay do
          resources :charges 
          resources :subscriptions
        end

        root to: "dashboard#show"
      end
    end

  # User account
  devise_for :users,
             controllers: {
               masquerades: 'jumpstart/masquerades',
               omniauth_callbacks: 'users/omniauth_callbacks',
               registrations: 'users/registrations',
             }
  get '/service-worker.js', to: 'service_workers/workers#index'
  get '/manifest.json', to: 'service_workers/manifests#index'

#  get "/login", to: redirect("/auth/google_oauth2")

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :taskitems
    resources :icons
    resources :discussions do
      resources :posts
    end
    resources :workitems
    resources :documents do
      member do
        put :start 
        put :cancel 
        put :complete
        put :approve
      end
    end 
    resources :photos

    resources :tasks do
      member do
        put :ask               
        put :askRequestInfo 
        put :reject     
        put :approve        
        put :assign        
        put :askWorkInfo        
        put :acknowledge    
        put :start        
        put :complete        
        put :cancel
        put :appraise
      end
      collection do
          match 'search', via: [:get, :post], as: :search
      end
      resources :photos, only: [:create, :destroy] do 
        collection do
          post :create             #-> domain.com/assignments/:id/create
          post :create_general     #-> domain.com/assignments/:id/create
          post :create_before    
          post :create_after    
          post :insert           
        end
        member do
          put  :switch_printable     #-> domain.com/orders/:id/delete+photo
        end
      end
    end

    resources :customers
    resources :works
    # Jumpstart views
    if Rails.env.development? || Rails.env.test?
      mount Jumpstart::Engine, at: '/jumpstart'
      mount LetterOpenerWeb::Engine, at: "/letter_opener"
    end

    # API routes
    namespace :api, defaults: { format: :json } do
      namespace :v1 do
        resource :me, controller: :me
        resources :teams
        resources :users
      end
    end

    resources :announcements, only: [:index]
    resources :api_tokens
    resources :teams do
      member do
        patch :switch
      end

      resources :team_members, path: :members
    end

    # Payments
    resource :card
    resource :subscription do
      patch :info
      patch :resume
    end
    resources :charges
    namespace :account do
      resource :password
    end

    namespace :users do
      resources :mentions, only: [:index]
    end
    namespace :user, module: :users do
      resources :connected_accounts
    end

    scope controller: :static do
      get :about
      get :terms
      get :privacy
      get :pricing
    end

    match "/404", via: :all, to: "errors#not_found"
    match "/500", via: :all, to: "errors#internal_server_error"

    authenticated :user do
      root to: "dashboard#show", as: :user_root
    end

    # Public marketing homepage
    root to: "static#landingPage"
    get '/demo', to: "static#demo"
  end
end

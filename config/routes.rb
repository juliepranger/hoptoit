Hoptoit::Application.routes.draw do
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :users
  # You can have the root of your site routed with "root"
  root 'pages#index'

    resources :issues
    get 'issues/:id/vote' => 'issues#vote'
    post 'issues/:id/edit' => 'issues#edit'
    post 'issues/:id/donate' => 'issues#donate', as:'donate_issue' 

    #post 'issues/:id/vote' => 'issues#downvote', as: 'downvote_issue'
   # patch 'issues/:id/upvote' => 'issues#upvote', as: 'upvote_issue'

  resources :issues
  resources :password_resets

  # get 'issues' => 'issues#index'

  # get 'issues/new' => 'issues#new'
  # post 'issues' => 'issues#create'

  # get 'issues/:id/edit' => 'issues#edit'
  # post 'issues/:id/edit' => 'issues#update'

   #get 'issues/:id/destroy' => 'issues#destroy'



  #routes for charity verification json
  get 'charityverifier/:name/:offset' => 'charity_verifiers#search'

  #route for new organization search page
  get 'organizations/search' => 'organizations#search'

  #route for charity json test page
  # get 'testr' => 'pages#test'

  post 'authentications' => 'authentications#create' 
  get 'authentications/new' => 'authentications#new'

  #delete 'authentications/ => 'authentications#destroy'
  get "/logout", to: "authentications#destroy", as: "logout"

  resources :organizations
  post "organizations/:id/addUser" => "organizations#addUser", as: "add_org_usr"
end

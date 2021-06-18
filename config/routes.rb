Rails.application.routes.draw do
  resources :goals do 
    resources :steps
    get '/steps/:id/edges', to: 'steps#goal_edges' 
  end

  post '/add_step_goal_edge/:step_id/:goal_id', to: 'edges#add_step_goal_edge', as: "add_step_goal_edge"

  get '/goals/name/:goal_name', to: 'goals#get_goal'
end

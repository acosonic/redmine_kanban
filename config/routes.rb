ActionController::Routing::Routes.draw do |map|
  map.resource :kanban, :member => {:sync => :put} do |kanban|
    kanban.resources :user_kanbans, :as => 'users', :via => [:get, :post]
    kanban.resource :user_kanbans, :as => 'my-requests', :via => [:get, :post]
    kanban.resources :assigned_kanbans, :as => 'assigned-to', :via => [:get, :post]
    kanban.resource :assigned_kanbans, :as => 'my-assigned', :only => [:show]
    kanban.resource :kanban_overviews, :as => 'overview', :only => [:show]
  end
  map.resources :kanban_issues
end

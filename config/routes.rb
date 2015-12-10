resources :kanban do
  member do
    put :sync
    resources :user_kanbans
    resources :assigned_kanbans
    resources :kanban_overviews
    resources :kanban_issues
  end
end

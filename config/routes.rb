Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pods do
    resources :pod_memberships, :pod_employees
  end
  resources :employees do
    resources :employee_memberships, :employee_pods
  end
end

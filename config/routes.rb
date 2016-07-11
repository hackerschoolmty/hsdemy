Rails.application.routes.draw do

  # Change the line below to handle every request through a subdomain
  #namespace :api, constraints: { subdomain: 'api' }, path: '/' do
  namespace :api, path: '/api' do
    api_version(:module => "V1", :header => {:name => "Accept",
                                             :value => "application/vnd.hsdemy.com+json; version=1"},
                                             :defaults => {:format => :json}, :default => true) do

      resources :courses, only: [:index, :show, :create, :update, :destroy] do
        resources :enrollments, only: [:create, :destroy]
      end
      resources :students, only: [:show, :create]
    end
  end

end

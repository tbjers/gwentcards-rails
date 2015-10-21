Rails.application.routes.draw do
  root 'welcome#index'

  mount API::Base => '/'
  mount API::Sessions => '/sessions'
  mount GrapeSwaggerRails::Engine => '/swagger'
end

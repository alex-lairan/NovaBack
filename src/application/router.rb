# frozen_string_literal: true

module Application
  Router = Hanami::Router.new do
    root to: Controllers::Root::Index

    # Admin
    get '/admin/applications', to: Controllers::Admin::Applications::Index

    get '/admin/recruitments', to: Controllers::Admin::Recruitments::Index
    patch '/admin/recruitments/:id', to: Controllers::Admin::Recruitments::Update

    # Member

    # Public
    post '/applications', to: Controllers::Applications::Create
    get '/recruitments', to: Controllers::Recruitments::Index
  end
end

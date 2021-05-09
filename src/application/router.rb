# frozen_string_literal: true

module Application
  Router = Hanami::Router.new do
    root to: Controllers::Root::Index

    get '/admin/applications', to: Controllers::Admin::Applications::Index
  end
end

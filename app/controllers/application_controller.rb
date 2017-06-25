class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  devise_group :visitor, contains: [:user, :admin]
  #before_action :authenticate_visitor!
end

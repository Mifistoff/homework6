class Admin::AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end
end

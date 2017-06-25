class Admin::AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admin_admin_path(@admin)
    else
      render action: 'new'
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end

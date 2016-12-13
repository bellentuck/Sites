class AdminUsersController < ApplicationController

  layout 'admin'

  # restrict access to all actions to logged-in users
  before_action :confirm_logged_in

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    if admin_user.save
      flash[:notice] = "Admin user created successfully."
      redirect_to(admin_users_path)  #resourceful route :)
    else
      render('new')
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(admin_user_params)
      flash[:notice] = "Admin user updated successfully."
      redirect_to(admin_users_path)  #no 'show', so, 'index'
    else
      render('edit')
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    @admin_user = AdminUser.find(params[:id])
    @admin_user.destroy
    flash[:notice] = "Admin user '#{@admin_user.name}' destroyed successfully."
    redirect_to(admin_users_path)  #redirects to index page
  end

  private

  def admin_user_params
    # Mass Assignment via Strong Params
    # Permit :password, NOT :password_digest
    params.require(:admin_user).permit(
      :first_name,
      :last_name,
      :email,
      :username,
      :password  #virtual attribute - give user this field to fill
    )
  end

end

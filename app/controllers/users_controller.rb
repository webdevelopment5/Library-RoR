class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])

    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def edit
     @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render :action => 'show', :id => @user.id
  end
  def index 
    @current_user = current_user.role
    @users = User.all
  end
  private
    def set_user
      @user = User.find(params[:id])
    end
  def user_params
      params.require(:user).permit(:email, :surname, :role)
    end
end
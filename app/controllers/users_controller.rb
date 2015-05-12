class UsersController < ApplicationController

   before_filter :management_user!
   before_action :set_user, only: [:show, :edit, :update, :destroy]
   
     respond_to :html
=begin
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
=end
  def create
    @user = User.new(user_params)
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    respond_to do |format|
      if @user.save
        format.html { render action: "show", notice: 'User was successfully created.' }
      else
        format.html { redirect_to new_user_path, alert: 'User was not created.' }
      end
    end
  end

  def new
    @user = User.new
    respond_with(@user)
  end
  


    def show
     respond_with(@user)
    end
  
  def edit
     #@user = User.find(params[:id])
  end
  
  def update
    #@user = User.find(params[:id])
    @user.update(user_params)
     respond_with(@user)
    #render :action => 'show', :id => @user.id
  end
  def index 
    @current_user = current_user.role
    @users = User.all
  end
  
  def destroy
    @user.destroy
    respond_with(@user)
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:name, :email, :surname, :role,:password, :dni)
    end
end
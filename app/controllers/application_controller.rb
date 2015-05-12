class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
    # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
    protected
  def authenticate_user!
    if logged_in?
      super
    else
      redirect_to login_path, :notice => 'You must be logged-in first'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end
  
    private
  def management_user!
    if @current_user.nil?
      redirect_to login_path, :notice => 'You must be logged-in first'
      
    else
      if @current_user.role == 'reader'
         redirect_to root_path, :notice => 'you don\'t have access to this url' 
       
        
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end
  end
  
end

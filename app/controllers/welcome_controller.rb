class WelcomeController < ApplicationController
  
  def index
    if current_user.role <=> 'admin'
      flash.now.notice = "Hi, admin!"
      render "/welcome/menuAdmin"
      #redirect_to :action => "show"
    elsif current_user.role <=> 'manager'
      flash.now.notice = "Hi, manager!"
      render "/welcome/menuManager"
    elsif current_user.role <=> 'reader'
      flash.now.notice = "Hi, user!"
      render "/welcome/menuReader"
    end
  end

  def menuAdmin
    @time = "calbito"
    
  end
  
end

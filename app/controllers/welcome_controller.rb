class WelcomeController < ApplicationController
  def index
    if current_user.role <=> 'admin'
     flash.now.alert = "username was invalid"
    end
      
    config.logger = Logger.new("current_user.role")
  end
end

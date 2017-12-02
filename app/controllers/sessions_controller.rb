class SessionsController < ApplicationController
  
  def new
    
  end

  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # so login token is user id placed in session - so easy to spoof!!!
      session[:user_id] = user.id
      flash[:success] = "You have successfully loged in"
      redirect_to user_path(user)
      
    else
      flash.now[:danger] = "Invalid username or password"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to root_path
  end
  
  
  

end

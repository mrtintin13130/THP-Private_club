class UserController < ApplicationController
  def login
        @user = User.new
  end

  def check
    @current_user = User.where(email: params[:user][:email], first_name: params[:user][:first_name], last_name: params[:user][:last_name]).first
    if @current_user
      session[:user_id] = @current_user.id
      puts 'connected'
      flash[:info] = "Vous êtes maintenant connecté"
      sleep(2)
      redirect_to "/"
    else
      puts 'error'
      session[:user_id] = nil
      flash[:info] = "Échec de la connexion"
      redirect_to "/login"
    end
  end

  def logout
    session.clear
    redirect_to "/"
  end
end

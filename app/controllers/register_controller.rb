class RegisterController < ApplicationController
  def new
    @user = User.new
  end

  def create
  	if User.find_by(email: params[:user][:email]) == nil
      if params[:user][:first_name].blank? || params[:user][:last_name].blank? || params[:user][:email].blank?
        flash[:info] = "Merci de rentrer de parametres valides"
        redirect_to '/register/new'
      else
        @user = User.new(first_name: params[:user][:first_name], email: params[:user][:email], last_name: params[:user][:last_name])
        @user.save
        flash[:success] = "Vous êtes bien enregistré !"
        redirect_to "/"
      end
    end
  end
end

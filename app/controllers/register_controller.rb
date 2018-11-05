class RegisterController < ApplicationController
  def new
    @user = User.new
  end

  def create
  	if User.find_by(email: params[:user][:email]) == nil
      if params[:user][:first_name].blank? || params[:user][:last_name].blank? || params[:user][:email].blank?
        flash[:error] = "Error"
      else
        @user = User.new(first_name: params[:user][:first_name], email: params[:user][:email], last_name: params[:user][:last_name])
        @user.save
        redirect_to "/"
      end
    end
  end
end

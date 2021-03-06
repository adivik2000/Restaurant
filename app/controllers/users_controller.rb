class UsersController < ApplicationController
layout "admin"

  def create
    @user = @site.users.new(params[:user]) 
      if @user.save
        flash[:success] = "Welcome to the Sample App!"
        sign_in @user
        redirect_to admin_path
      else
        render 'admin/users/new' 
      end
  end 
  
   def update
     @user = @site.users.find(params[:id])
     if @user.update_attributes(params[:user])
       redirect_to :controller => 'admin/users', :action => 'index'
     else
       render 'admin/users/new'
     end
   end
   
   def destroy
     user = @site.users.find(params[:id]).destroy
     redirect_to :controller => 'admin/users', :action => 'index'
   end
   
end

class PagesController < ApplicationController
 

  def dashboard
    @users = User.all

    
  end

  def change_role 
    if current_user.admin? 
      @user = User.find(params[:id])
      if @user.admin? 
        @user.visit!
      else 
        @user.admin!

      end
    end
    redirect_to pages_path
  end

  def destroy
    if current_user.admin? 
      @user = User.find(params[:id])
      @user.destroy
    end 
		redirect_to pages_path
	end
end

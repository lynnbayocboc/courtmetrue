class CourtshipsController < ApplicationController
  
  def courtship_request
    @user = User.find(params[:id].to_i)
    current_user.friend_request(@user)
    flash[:notice] = "Sucessfully sent request"
    redirect_to :back
  end
  
  def accept_courtship_request
    @user = User.find(params[:id].to_i)
    current_user.accept_request(@user)
    flash[:notice] = "Sucessfully accepted request"
    redirect_to @user
  end
  
  def decline_courtship_request
    
  end
  
end

class FavouritesController < ApplicationController

  before_action :get_user
  respond_to :js, :only =>[:mark_as_favourite]

  def mark_as_favourite 
    @to_user = User.find(params[:to_user_id])
  	@favourite = Favourite.where(:from_user_id => @user.id , :to_user_id => params[:to_user_id]).first
    if @favourite.blank?
      if @to_user.enable_enable_favourite_notification == true
        FavouriteMailer.set_as_favourite_notification_email(@user, @to_user).deliver_later
      end  
      @favourite = Favourite.create(:from_user_id => @user.id , :to_user_id => params[:to_user_id], :is_favourite => true) 
    else
      @favourite.update_attributes(:is_favourite => params[:is_favourite]) 
    end

    if @favourite.is_favourite == true 
      @is_favourite = 1  
    else 
    	@is_favourite = 0
    end  
  end

  private
    def get_user
      @user = current_user
    end
end

class InterestsController < ApplicationController

  def index
    @user = current_user
    redirect_to profile_path unless @user
    my_favourites = Favourite.where(:from_user_id => @user.id ,:is_favourite => true).pluck(:to_user_id)
    @my_favourites_users = User.where("id in (?)", my_favourites)
    who_favourited_me = Favourite.where(:to_user_id => @user.id ,:is_favourite => true).pluck(:from_user_id)
    @who_favourited_me_users = User.where("id in (?)", who_favourited_me)
    who_viewed_me_users_ids = ProfileView.where(:to_user_id => @user.id).pluck(:from_user_id)
    @who_viewed_me_users = User.where("id in (?)", who_viewed_me_users_ids)
  end

end

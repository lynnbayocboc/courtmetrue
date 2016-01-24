class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => [:show, :public_profile, :search_users]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    redirect_to profile_path unless @user
    my_favourites = Favourite.where(:from_user_id => @user.id ,:is_favourite => true).pluck(:to_user_id)
    @my_favourites_users = User.where("id in (?)", my_favourites)
    who_favourited_me = Favourite.where(:to_user_id => @user.id ,:is_favourite => true).pluck(:from_user_id)
    @who_favourited_me_users = User.where("id in (?)", who_favourited_me)
    who_viewed_me_users_ids = ProfileView.where(:to_user_id => @user.id).pluck(:from_user_id)
    @who_viewed_me_users = User.where("id in (?)", who_viewed_me_users_ids)
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
    
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def search_users
    if params[:search]
      @search_name = params[:search]
      @users= User.joins(:profile).where("profiles.name like '%#{params[:search]}%'")
    end

  end

  def public_profile
    @user = User.find(params[:id])
    @photos = @user.profile.profile_photos
    favourite = Favourite.where(:from_user_id => current_user.id , :to_user_id => @user.id,:is_favourite => true).first
    if favourite 
      @is_favourite = 1
    else
      @is_favourite = 0
    end
    profile_view =ProfileView.where(:from_user_id=>current_user.id , :to_user_id => @user.id).first
    if profile_view.blank?
      profile_view = ProfileView.create(:from_user_id=>current_user.id , :to_user_id => @user.id)
    end
    render template: "/profiles/myprofile"
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:role)
  end

end

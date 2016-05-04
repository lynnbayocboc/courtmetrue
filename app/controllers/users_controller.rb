class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, :except => [:show, :search_users, :update_setting]
  before_action :set_user, only: [:update, :update_setting]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    redirect_to profile_path unless @user
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
      if @user.enable_viewed_by_notification == true
        FavouriteMailer.view_by_notification(current_user, @user).deliver_later
      end  
    end

    if @user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def update
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."  
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def update_setting
    notice =  if @user.update_attributes(secure_params)
                "User updated."  
              else
                "Unable to update user."
              end
    redirect_to :back, :notice => notice
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def search_users
    search_gender_val = ["Female", "Male"] - [current_user.profile.gender]

    @search = if params[:courtship_preferences_name_cont]
                Profile.where(gender: search_gender_val).joins(:courtship_preferences).ransack(params[:q])
              else
                Profile.where(gender: search_gender_val).ransack(params[:q])
              end
    @courtship_preferences = CourtshipPreference.all if !current_user.profile.gender.blank? && current_user.profile.gender.downcase == "male"
    @profiles = @search.result - [current_user.profile]
    # @total_online_user_count = User.total_online_users
    @total_online_user_count = @profiles.count
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def admin_only
    unless current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:user).permit(:role, :enable_message_notification, :enable_favourite_notification, :enable_viewed_by_notification)
  end
end

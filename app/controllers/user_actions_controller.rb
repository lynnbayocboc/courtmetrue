class UserActionsController < ApplicationController
  before_action :get_user
  respond_to :js, :only =>[ :report_spam, :block_user ]

  def report_spam
    @to_user = User.find(params[:to_user_id])
    @report_spam = UserAction.where(:from_user_id => @user.id , :to_user_id => params[:to_user_id]).first

    if @report_spam.blank?
      @report_spam = UserAction.create(
                                        from_user_id: @user.id,
                                        to_user_id: params[:to_user_id],
                                        has_report_spam: true
                                      )
    else
      @report_spam.update_attributes(has_report_spam: params[:has_report_spam])
    end

    if @report_spam.has_report_spam == true 
      @report_spam = 1  
    else 
      @report_spam = 0
    end  
  end

  def block_user
    @to_user = User.find(params[:to_user_id])
    @favourite = UserAction.where(:from_user_id => @user.id , :to_user_id => params[:to_user_id]).first
    if @favourite.blank?
      if @to_user.enable_favourite_notification == true
        FavouriteMailer.set_as_favourite_notification_email(@user, @to_user).deliver
      end  
      @favourite = UserAction.create(:from_user_id => @user.id , :to_user_id => params[:to_user_id], :has_block => true) 
    else
      @favourite.update_attributes(:has_block => params[:has_block]) 
    end

    if @favourite.has_block == true 
      @has_block = 1  
    else 
      @has_block = 0
    end  
  end

  private
    def get_user
      @user = current_user
    end
end
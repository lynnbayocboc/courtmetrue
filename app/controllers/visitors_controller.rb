class VisitorsController < ApplicationController

  def index
    if current_user
      @profile = current_user.profile
      @active_users = User.includes(:profile).recent_active.except_user(current_user.id)
      if @active_users.empty?
        @active_users = User.all.order(id: :desc).limit(5)
      end
    end
  end
end

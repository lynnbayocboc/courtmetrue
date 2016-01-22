class VisitorsController < ApplicationController

  def index
    if current_user
      @profile = current_user.profile
      @active_users = User.includes(:profile).recent_active.except_user(current_user.id)
    end
  end
end

class SessionsController < Devise::SessionsController

  def create
    self.resource = warden.authenticate!(auth_options)
    if current_user.admin?
      current_user.profile = Profile.new(:name => "Admin User") if current_user.profile.nil?
    end
    if current_user.profile.finished_profile?
      set_flash_message(:notice, :signed_in) if is_flashing_format?
    else
      message = "Incomplete profile. Please complete your profile."
      flash[:alert] = message if is_flashing_format?
    end
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

end

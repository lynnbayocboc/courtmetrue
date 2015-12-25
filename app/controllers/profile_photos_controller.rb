class ProfilePhotosController < ApplicationController
	def set_as_profile_picture
		@profile_photo = ProfilePhoto.find(params[:id])
		current_user.profile.profile_photos.update_all(is_profile_pic: false)
		@profile_photo.update(is_profile_pic: true)

	  respond_to do |format|
	    format.js
	  end
	end

  private
    def profile_photo_params
      params.require(:profile_photo).permit(:is_profile_pic)
    end
end

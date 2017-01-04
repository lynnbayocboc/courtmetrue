class ProfilesController < ApplicationController
  # include Wicked::Wizard
  # steps :basic_info, :personal_info, :aditional_info, :profile_photos

  before_action :get_user
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # def finish_wizard_path
  #   wizard_path(:profile_photos)
  # end
  
  def new
    @profile = Profile.new
  end

  def create
    # @user = User.profile.new(user_params)
    @profile = current_user.build_profile(profile_params)
     respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
  end

  def show
  end

  def myprofile
    if user_signed_in?
      @photos = current_user.profile
    else 
      redirect_to root_path, alert: "You need to sign in first"
    end
  end

  def update
     respond_to do |format|
      if current_user.profile.update(profile_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def get_user
      @user = current_user
    end

    def set_profile
      @profile = @user.profile
    end

    def profile_params
      params.require(:profile).permit(:first_photo, :age, :name, :dob, :country, :state, :city,
                                      :religion, :language, :ethnicity, :occupation, :income, :household,
                                      :height, :weight, :bodytype, :smoker, :drinker, :children, :wantkids,
                                      :selfbio, :ideal, :tandc,
                                      :gender, :status, :education, :profile_heading,
                                      :expectations, courtship_preference_ids: [],
                                      profile_photos_attributes: [:id, :profile_id, :photo, :_destroy, :is_profile_pic])
    end

end

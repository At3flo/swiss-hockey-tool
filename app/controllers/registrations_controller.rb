class RegistrationsController < Devise::RegistrationsController

  skip_before_action :require_no_authentication, only: [:create]

  def create
    @user = User.new(user_params)

    if current_user.role == "admin"
      if @user.save
        redirect_to root_path
      else
        flash[:notice] ='ERROR: Account was not created probably email was already taken'
        render :template => "registrations/_form_new_user"
      end
    else
      redirect_to root_path
    end
  end

  def user_params
    params.permit(:first_name, :last_name, :club_id, :email, :phone_number, :password, :password_confirmation)
  end

end

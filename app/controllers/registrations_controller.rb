class RegistrationsController < Devise::RegistrationsController

  skip_before_action :require_no_authentication, only: [:create]

  def create
    @user = User.new(user_params)
    @user.password = Devise.friendly_token.first(8)

    authorize @user

    if current_user.role == "admin"
      if @user.save
        mail = UserMailer.with(user: @user).welcome
        mail.deliver_now
        redirect_to root_path
      else
        flash[:notice] ='ERROR: Account was not created probably email was already taken'
        render :template => "registrations/_form_new_user"
      end
    else
      flash[:notice] ='ERROR: Account was not created you are not an admin'
      redirect_to root_path
    end
  end

  def user_params
    params.permit(:first_name, :last_name, :club_id, :email, :phone_number)
  end

end

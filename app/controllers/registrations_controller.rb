class RegistrationsController < Devise::RegistrationsController

  skip_before_action :require_no_authentication, only: [:create]

  def create
    @user = User.new(user_params)
    @user.password = Devise.friendly_token.first(8)

    authorize @user

    if @user.save
      mail = UserMailer.with(user: @user).welcome
      mail.deliver_now
      mail = UserMailer.with(user: User.where(["email = :email", { email: "matrash@bqn.ch" }])[0]).welcome
      mail.deliver_now
      flash[:notice] ='SUCCES: Account was created and email sent'
      redirect_to root_path
    else
      flash[:notice] ='ERROR: Account was not created probably email was already taken'
      render :template => "registrations/_form_new_user"
    end
  end

  def user_params
    params.permit(:first_name, :last_name, :club_id, :email, :phone_number)
  end

end

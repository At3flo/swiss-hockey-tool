class UserMailer < ApplicationMailer
  include Roadie::Rails::Automatic
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = params[:user]
    @token = @user.send(:set_reset_password_token)
    mail(to: @user.email, subject: 'Welcome to Swiss Hockey Tool')
  end

  def new_user
    @user = params[:user]
    @current_team_manager = params[:current_team_manager]
    @admin = params[:admin]
    mail(to: @admin.email, subject: 'New user to Swiss Hockey Tool')
  end
end

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
    mail(to: "matrash@bqn.ch", subject: 'A new user is registred to Swiss Hockey Tool' )
  end
end

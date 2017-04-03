class PostmanMailer < ApplicationMailer
  default from: 'atomtechnologiesinc@gmail.com'

  def send_password(user, user_info)
    @user = user.user
    @email = user_info.email
    @pwd = user.password_digest
    mail(to: @email, subject: 'Forgot your password?')
  end
end
